using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Canvas par ek empty/panel object me lagao.
/// indicatorPrefab = red dot (UI Image prefab, RectTransform ke saath).
/// Pooling use hoti hai, isliye performance achi rahegi (mobile friendly).
/// </summary>
public class TargetIndicatorManager : MonoBehaviour
{
    [Header("References")]
    public Canvas canvas;
    public Camera playerCamera;
    public RectTransform indicatorPrefab;

    [Header("Settings")]
    public float maxDistance = 80f;        // is se door animal ka indicator nahi dikhega
    public bool hideWhenOffScreen = true;  // false karo to edge par clamp hoga
    public float edgePadding = 40f;        // clamp mode me screen edge se gap
    public bool scaleWithDistance = true;
    public float minScale = 0.5f;
    public float maxScale = 1f;

    static readonly List<AnimalTarget> targets = new List<AnimalTarget>();
    readonly Dictionary<AnimalTarget, RectTransform> active = new Dictionary<AnimalTarget, RectTransform>();
    readonly Stack<RectTransform> pool = new Stack<RectTransform>();
    readonly List<AnimalTarget> removeList = new List<AnimalTarget>();

    RectTransform canvasRect;

    public static void Register(AnimalTarget t)
    {
        if (!targets.Contains(t)) targets.Add(t);
    }

    public static void Unregister(AnimalTarget t)
    {
        targets.Remove(t);
    }

    void Awake()
    {
        if (canvas == null) canvas = GetComponentInParent<Canvas>();
        if (playerCamera == null) playerCamera = Camera.main;
        canvasRect = canvas.GetComponent<RectTransform>();
    }

    void LateUpdate()
    {
        // 1) Jo targets list se hat gaye (dead/disabled) unke indicators wapas pool me
        removeList.Clear();
        foreach (var kv in active)
        {
            if (kv.Key == null || !targets.Contains(kv.Key))
                removeList.Add(kv.Key);
        }
        for (int i = 0; i < removeList.Count; i++)
        {
            Release(removeList[i]);
        }

        // 2) Har live target ka indicator update karo
        for (int i = 0; i < targets.Count; i++)
        {
            AnimalTarget t = targets[i];
            if (t == null || t.isDead) continue;

            Vector3 worldPos = t.IndicatorWorldPosition;
            Vector3 screenPos = playerCamera.WorldToScreenPoint(worldPos);
            float distance = Vector3.Distance(playerCamera.transform.position, worldPos);

            bool behind = screenPos.z < 0f;
            bool outOfRange = distance > maxDistance;
            bool offScreen = behind ||
                             screenPos.x < 0 || screenPos.x > Screen.width ||
                             screenPos.y < 0 || screenPos.y > Screen.height;

            if (outOfRange || (offScreen && hideWhenOffScreen))
            {
                Hide(t);
                continue;
            }

            // Camera ke peeche wale target ka screenPos flip hota hai, usay theek karo
            if (behind)
            {
                screenPos.x = Screen.width - screenPos.x;
                screenPos.y = Screen.height - screenPos.y;
            }

            // Edge clamp
            screenPos.x = Mathf.Clamp(screenPos.x, edgePadding, Screen.width - edgePadding);
            screenPos.y = Mathf.Clamp(screenPos.y, edgePadding, Screen.height - edgePadding);

            RectTransform ui = GetOrCreate(t);
            ui.gameObject.SetActive(true);

            // Screen point -> canvas local point (Overlay aur Camera dono canvas modes me chalta hai)
            Camera uiCam = canvas.renderMode == RenderMode.ScreenSpaceOverlay ? null : canvas.worldCamera;
            RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasRect, screenPos, uiCam, out Vector2 localPos);
            ui.anchoredPosition = localPos;

            if (scaleWithDistance)
            {
                float s = Mathf.Lerp(maxScale, minScale, distance / maxDistance);
                ui.localScale = Vector3.one * s;
            }
        }
    }

    RectTransform GetOrCreate(AnimalTarget t)
    {
        if (active.TryGetValue(t, out var ui)) return ui;

        ui = pool.Count > 0 ? pool.Pop() : Instantiate(indicatorPrefab, transform);
        ui.SetParent(transform, false);
        active[t] = ui;
        return ui;
    }

    void Hide(AnimalTarget t)
    {
        if (active.TryGetValue(t, out var ui) && ui.gameObject.activeSelf)
            ui.gameObject.SetActive(false);
    }

    void Release(AnimalTarget t)
    {
        if (active.TryGetValue(t, out var ui))
        {
            ui.gameObject.SetActive(false);
            pool.Push(ui);
            active.Remove(t);
        }
    }
}
