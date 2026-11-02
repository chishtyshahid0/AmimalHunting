using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

// Button A dabane par B "Target Point" par jata hai, dobara dabane par wapas apni jagah par.
// Button B ko dabane par B "Point C" par chala jata hai.
// Script kisi bhi active object par lagao (jaise Canvas). OnClick set karne ki zaroorat nahi.
public class ToggleMoveOnClick : MonoBehaviour
{
    [Header("Jo button dabana hai (Button A)")]
    public Button buttonA;

    [Header("Jo object move hona hai (Button B, is par Button component zaroori hai)")]
    public RectTransform objectB;

    [Header("A dabane par B yahan jayega")]
    public RectTransform targetPoint;

    [Header("B dabane par B yahan jayega (Point C)")]
    public RectTransform pointC;

    [Header("Speed (0 = foran jump)")]
    public float moveSpeed = 8f;

    private enum Spot { Original, Target, C }

    private Vector3 originalPosition;
    private Spot current = Spot.Original;

    void Start()
    {
        if (EventSystem.current == null)
            Debug.LogError("Scene mein EventSystem nahi hai! GameObject > UI > Event System add karo.");
        if (buttonA == null || objectB == null || targetPoint == null || pointC == null)
        {
            Debug.LogError("buttonA, objectB, targetPoint ya pointC assign nahi hai!");
            enabled = false;
            return;
        }

        // B ki pehli jagah yaad rakh lo
        originalPosition = objectB.position;

        // Layout Group B ko wapas na kheenche
        LayoutElement le = objectB.GetComponent<LayoutElement>();
        if (le == null) le = objectB.gameObject.AddComponent<LayoutElement>();
        le.ignoreLayout = true;

        Animator anim = objectB.GetComponent<Animator>();
        if (anim != null) anim.enabled = false;

        buttonA.onClick.AddListener(Toggle);

        Button buttonB = objectB.GetComponent<Button>();
        if (buttonB != null) buttonB.onClick.AddListener(GoToC);
        else Debug.LogWarning("objectB par Button component nahi hai, is liye B dabane se Point C par nahi jayega.");
    }

    // Button A: Target par jao, dobara dabao to wapas original par
    public void Toggle()
    {
        current = (current == Spot.Target) ? Spot.Original : Spot.Target;
        Debug.Log("A dabaya, B ja raha hai: " + current);
        if (moveSpeed <= 0f) objectB.position = GetDestination();
    }

    // Button B: Point C par jao
    public void GoToC()
    {
        current = Spot.C;
        Debug.Log("B dabaya gaya, B Point C par ja raha hai");
        if (moveSpeed <= 0f) objectB.position = GetDestination();
    }

    private Vector3 GetDestination()
    {
        switch (current)
        {
            case Spot.Target: return targetPoint.position;
            case Spot.C: return pointC.position;
            default: return originalPosition;
        }
    }

    void Update()
    {
        if (moveSpeed <= 0f) return;
        objectB.position = Vector3.Lerp(objectB.position, GetDestination(), moveSpeed * Time.deltaTime);
    }
}
