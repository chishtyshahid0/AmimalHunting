using UnityEngine;
using UnityEngine.UI;

// Normal UI Slider (GameObject > UI > Slider) se camera zoom in / zoom out.
// Script ko Main Camera par lagao aur Inspector mein apna Slider drag karo.
// OnValueChanged set karne ki zaroorat nahi, script khud jor deti hai.
public class CameraSliderZoom : MonoBehaviour
{
    [Header("Zoom wala Slider")]
    public Slider zoomSlider;

    [Header("Camera (khali = isi object ka camera)")]
    public Camera cam;

    [Header("Perspective camera: Field of View")]
    public float fovZoomOut = 70f;   // slider sabse neeche/left
    public float fovZoomIn = 25f;    // slider sabse upar/right

    [Header("Orthographic camera: Size")]
    public float sizeZoomOut = 10f;
    public float sizeZoomIn = 3f;

    [Header("Smoothness (0 = foran zoom)")]
    public float smooth = 10f;

    private float targetValue;   // 0 se 1 (slider ki value)
    private float currentValue;  // 0 se 1 (camera par abhi lagi hui)

    void Start()
    {
        if (cam == null) cam = GetComponent<Camera>();
        if (cam == null) cam = Camera.main;

        if (cam == null)
        {
            Debug.LogError("Camera nahi mila! Script ko Camera wale object par lagao.");
            enabled = false;
            return;
        }
        if (zoomSlider == null)
        {
            Debug.LogError("Zoom Slider assign nahi hai! Inspector mein Slider drag karo.");
            enabled = false;
            return;
        }

        zoomSlider.onValueChanged.AddListener(OnSliderChanged);
        OnSliderChanged(zoomSlider.value);   // shuru ki value lagao
        currentValue = targetValue;
        ApplyNow();
    }

    void OnSliderChanged(float value)
    {
        targetValue = Mathf.InverseLerp(zoomSlider.minValue, zoomSlider.maxValue, value);
    }

    // LateUpdate: baqi scripts ke baad chalta hai, is liye camera hilta nahi
    void LateUpdate()
    {
        // Apni hi value par smoothing (camera se wapas padh kar nahi), isse jitter nahi hota
        if (smooth <= 0f) currentValue = targetValue;
        else currentValue = Mathf.Lerp(currentValue, targetValue, 1f - Mathf.Exp(-smooth * Time.deltaTime));

        // Bohat chhota farq ho to seedha target par lock kar do
        if (Mathf.Abs(currentValue - targetValue) < 0.0005f) currentValue = targetValue;

        ApplyNow();
    }

    void ApplyNow()
    {
        if (cam.orthographic)
            cam.orthographicSize = Mathf.Lerp(sizeZoomOut, sizeZoomIn, currentValue);
        else
            cam.fieldOfView = Mathf.Lerp(fovZoomOut, fovZoomIn, currentValue);
    }
}
