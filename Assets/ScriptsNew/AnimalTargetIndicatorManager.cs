using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// AnimalTargetIndicatorManager:
/// 1. Game load par indicators CHHUPE rehte hain.
/// 2. HUNT button click (StartGame / OnStartHuntingClick) ke baad har zinda animal par Red Dot dikhta hai.
/// 3. Scope (zoom) on hone par dot chhota ho jata hai, aur scope off par normal size par wapas aata hai.
/// 4. Animal mar jaye to uska dot TURANT ghayab ho jata hai.
/// 5. Level complete / fail hone par sare dots khatam ho jate hain.
/// </summary>
public class AnimalTargetIndicatorManager : MonoBehaviour
{
    public static AnimalTargetIndicatorManager Instance;

    private static bool isHuntingStarted = false;
    private static bool isLevelEnded = false;

    private Canvas overlayCanvas;
    private Sprite circleSprite;

    private class AnimalDot
    {
        public AnimalBehaviour animal;
        public GameObject dotObj;
        public RectTransform rectTransform;
        public Image image;
    }

    private List<AnimalDot> activeDots = new List<AnimalDot>();
    private Camera targetCamera;

    [Header("Dot Sizes")]
    public float normalDotSize = 26f;
    public float zoomedDotSize = 13f;
    public Color dotColor = new Color(0.95f, 0.12f, 0.12f, 0.95f);
    public float heightOffset = 1.3f;

    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
    private static void AutoInit()
    {
        isHuntingStarted = false;
        isLevelEnded = false;

        GameObject managerObj = new GameObject("AnimalTargetIndicatorManager");
        Instance = managerObj.AddComponent<AnimalTargetIndicatorManager>();
        DontDestroyOnLoad(managerObj);
    }

    private void Awake()
    {
        Instance = this;
        CreateCanvas();
        CreateCircleSprite();
    }

    private void CreateCanvas()
    {
        GameObject canvasObj = new GameObject("AnimalIndicatorCanvas");
        canvasObj.transform.SetParent(this.transform);
        overlayCanvas = canvasObj.AddComponent<Canvas>();
        overlayCanvas.renderMode = RenderMode.ScreenSpaceOverlay;
        overlayCanvas.sortingOrder = 999; // Top of UI elements

        CanvasScaler scaler = canvasObj.AddComponent<CanvasScaler>();
        scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(1920, 1080);
        scaler.matchWidthOrHeight = 0.5f;

        canvasObj.AddComponent<GraphicRaycaster>();
    }

    private void CreateCircleSprite()
    {
        // Smooth circle texture
        int res = 64;
        Texture2D tex = new Texture2D(res, res, TextureFormat.RGBA32, false);
        tex.filterMode = FilterMode.Bilinear;
        float center = (res - 1) / 2f;
        float radius = center - 1f;

        Color[] colors = new Color[res * res];
        for (int y = 0; y < res; y++)
        {
            for (int x = 0; x < res; x++)
            {
                float dist = Vector2.Distance(new Vector2(x, y), new Vector2(center, center));
                float alpha = Mathf.Clamp01((radius - dist) + 0.5f);
                colors[y * res + x] = new Color(1f, 1f, 1f, alpha);
            }
        }
        tex.SetPixels(colors);
        tex.Apply();

        circleSprite = Sprite.Create(tex, new Rect(0, 0, res, res), new Vector2(0.5f, 0.5f));
    }

    /// <summary>
    /// HUNT button click par call hota hai.
    /// </summary>
    public static void StartHunting()
    {
        isHuntingStarted = true;
        isLevelEnded = false;

        if (Instance != null)
        {
            Instance.RefreshAnimalList();
        }
    }

    /// <summary>
    /// Level complete ya fail hone par call hota hai (Sare dots remove).
    /// </summary>
    public static void EndLevel()
    {
        isLevelEnded = true;
        isHuntingStarted = false;

        if (Instance != null)
        {
            Instance.ClearAllDots();
        }
    }

    /// <summary>
    /// Specific animal ke die hone par turant uska dot destroy hota hai.
    /// </summary>
    public static void OnAnimalDied(AnimalBehaviour animal)
    {
        if (Instance == null || animal == null) return;
        Instance.RemoveDotForAnimal(animal);
    }

    public void RefreshAnimalList()
    {
        ClearAllDots();

        if (isLevelEnded || !isHuntingStarted) return;

        AnimalBehaviour[] allAnimals = FindObjectsOfType<AnimalBehaviour>();
        if (allAnimals == null) return;

        for (int i = 0; i < allAnimals.Length; i++)
        {
            AnimalBehaviour anim = allAnimals[i];
            if (anim != null && !anim.isDead && anim.gameObject.activeInHierarchy)
            {
                CreateDot(anim);
            }
        }
    }

    private void CreateDot(AnimalBehaviour animal)
    {
        if (overlayCanvas == null) CreateCanvas();

        GameObject dot = new GameObject("Indicator_" + animal.name);
        dot.transform.SetParent(overlayCanvas.transform, false);

        RectTransform rt = dot.AddComponent<RectTransform>();
        float currentSize = UIcontrol.Enablezoom ? zoomedDotSize : normalDotSize;
        rt.sizeDelta = new Vector2(currentSize, currentSize);

        Image img = dot.AddComponent<Image>();
        img.sprite = circleSprite;
        img.color = dotColor;
        img.raycastTarget = false;

        activeDots.Add(new AnimalDot
        {
            animal = animal,
            dotObj = dot,
            rectTransform = rt,
            image = img
        });
    }

    private void RemoveDotForAnimal(AnimalBehaviour animal)
    {
        for (int i = activeDots.Count - 1; i >= 0; i--)
        {
            if (activeDots[i].animal == animal || activeDots[i].animal == null)
            {
                if (activeDots[i].dotObj != null)
                {
                    Destroy(activeDots[i].dotObj);
                }
                activeDots.RemoveAt(i);
            }
        }
    }

    public void ClearAllDots()
    {
        for (int i = 0; i < activeDots.Count; i++)
        {
            if (activeDots[i] != null && activeDots[i].dotObj != null)
            {
                Destroy(activeDots[i].dotObj);
            }
        }
        activeDots.Clear();
    }

    private void Update()
    {
        if (!isHuntingStarted || isLevelEnded)
        {
            if (activeDots.Count > 0) ClearAllDots();
            return;
        }

        if (targetCamera == null || !targetCamera.gameObject.activeInHierarchy)
        {
            targetCamera = Camera.main;
        }

        if (targetCamera == null) return;

        bool isZoomed = UIcontrol.Enablezoom;
        float targetSize = isZoomed ? zoomedDotSize : normalDotSize;

        for (int i = activeDots.Count - 1; i >= 0; i--)
        {
            AnimalDot item = activeDots[i];

            // 1. Agar animal destroy ya mar gaya to TURANT dot delete karo
            if (item.animal == null || item.animal.isDead || !item.animal.gameObject.activeInHierarchy)
            {
                if (item.dotObj != null) Destroy(item.dotObj);
                activeDots.RemoveAt(i);
                continue;
            }

            // 2. Zoom ke hisaab se dot size smoothly adjust karo
            if (item.rectTransform != null)
            {
                item.rectTransform.sizeDelta = Vector2.Lerp(
                    item.rectTransform.sizeDelta,
                    new Vector2(targetSize, targetSize),
                    Time.unscaledDeltaTime * 15f
                );
            }

            // 3. Animal body / spine center position
            Vector3 worldTarget = item.animal.transform.position + Vector3.up * heightOffset;
            Vector3 screenPos = targetCamera.WorldToScreenPoint(worldTarget);

            // Agar camera ke peeche hai to chupa do
            if (screenPos.z < 0f)
            {
                if (item.dotObj.activeSelf) item.dotObj.SetActive(false);
                continue;
            }

            if (!item.dotObj.activeSelf) item.dotObj.SetActive(true);

            if (item.rectTransform != null)
            {
                item.rectTransform.position = screenPos;
            }
        }
    }
}
