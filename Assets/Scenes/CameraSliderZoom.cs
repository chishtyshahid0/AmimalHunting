using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

// Slider (aur mouse wheel) se camera zoom, lekin zoom usi point par hota hai
// jahan mouse/touch scene mein aakhri baar tha (ya screen center / target object).
// Script ko Main Camera par lagao aur Inspector mein Slider drag karo.
public class CameraSliderZoom : MonoBehaviour
{
    public enum FocusMode
    {
        Pointer,        // mouse/touch ka aakhri point (UI ke bahar), click ki zaroorat nahi
        ScreenCenter,   // hamesha screen ka center
        TargetObject    // neeche diya hua Target object
    }

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

    [Header("Camera position shift (follow camera / player game ho to OFF rakho)")]
    [Tooltip("OFF = sirf FOV/Size change hoga, camera apni jagah se nahi hilega (player peechay nahi jayega)")]
    public bool shiftCameraToFocus = false;

    [Header("Zoom point")]
    public FocusMode focusMode = FocusMode.Pointer;

    [Tooltip("Focus Mode = TargetObject ho to is object par zoom hoga")]
    public Transform target;

    [Tooltip("Perspective mein: collider na mile to focus point camera se itni door maana jaye")]
    public float perspectiveFocusDistance = 10f;

    [Header("Mouse wheel")]
    public bool useMouseWheel = true;
    [Tooltip("Wheel ke ek notch par slider kitna (0 se 1) hilega")]
    public float wheelStep = 0.1f;

    private float targetValue;   // 0 se 1 (slider ki value)
    private float currentValue;  // 0 se 1 (camera par abhi lagi hui)

    private Vector2 focusScreen; // screen par wo point jahan zoom hona hai
    private float focusDepth;    // perspective: camera se focus point ka fasla
    private Vector2 lastMousePos;

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

        focusScreen = new Vector2(Screen.width * 0.5f, Screen.height * 0.5f);
        focusDepth = perspectiveFocusDistance;
        lastMousePos = Input.mousePosition;

        zoomSlider.onValueChanged.AddListener(OnSliderChanged);
        targetValue = Normalize(zoomSlider.value);
        currentValue = targetValue;
        ApplyZoom();
    }

    float Normalize(float v)
    {
        return Mathf.InverseLerp(zoomSlider.minValue, zoomSlider.maxValue, v);
    }

    void OnSliderChanged(float value)
    {
        targetValue = Normalize(value);
    }

    bool PointerOverUI(int fingerId = -1)
    {
        return EventSystem.current != null && EventSystem.current.IsPointerOverGameObject(fingerId);
    }

    void Update()
    {
        if (focusMode == FocusMode.Pointer)
        {
            // Mouse scene ke upar hile to focus update karo (UI par ho to purana point rehta hai)
            Vector2 mp = Input.mousePosition;
            if ((mp - lastMousePos).sqrMagnitude > 0.01f)
            {
                lastMousePos = mp;
                if (!PointerOverUI()) SetFocus(mp);
            }

            if (Input.GetMouseButtonDown(0) && !PointerOverUI())
                SetFocus(Input.mousePosition);

            // Touch tap
            if (Input.touchCount > 0)
            {
                Touch t = Input.GetTouch(0);
                if (t.phase == TouchPhase.Began && !PointerOverUI(t.fingerId))
                    SetFocus(t.position);
            }
        }

        // Mouse wheel
        if (useMouseWheel)
        {
            float scroll = Input.mouseScrollDelta.y;
            if (Mathf.Abs(scroll) > 0.001f && !PointerOverUI())
            {
                if (focusMode == FocusMode.Pointer)
                    SetFocus(Input.mousePosition);

                float range = zoomSlider.maxValue - zoomSlider.minValue;
                zoomSlider.value = Mathf.Clamp(
                    zoomSlider.value + scroll * wheelStep * range,
                    zoomSlider.minValue, zoomSlider.maxValue);
            }
        }
    }

    void SetFocus(Vector2 screenPos)
    {
        focusScreen = screenPos;

        if (!cam.orthographic)
        {
            Ray ray = cam.ScreenPointToRay(screenPos);
            if (Physics.Raycast(ray, out RaycastHit hit))
                focusDepth = Vector3.Dot(hit.point - cam.transform.position, cam.transform.forward);
            else
                focusDepth = perspectiveFocusDistance;
        }
    }

    void LateUpdate()
    {
        float prev = currentValue;

        if (smooth <= 0f) currentValue = targetValue;
        else currentValue = Mathf.Lerp(currentValue, targetValue, 1f - Mathf.Exp(-smooth * Time.deltaTime));

        if (Mathf.Abs(currentValue - targetValue) < 0.0005f) currentValue = targetValue;

        // Zoom nahi badla to camera ko chhuo hi mat
        if (Mathf.Approximately(prev, currentValue)) return;

        // Position shift band ho to sirf FOV/Size change karo, camera hilao mat
        if (!shiftCameraToFocus)
        {
            ApplyZoom();
            return;
        }

        // Focus point tay karo
        if (focusMode == FocusMode.ScreenCenter)
        {
            focusScreen = new Vector2(Screen.width * 0.5f, Screen.height * 0.5f);
            focusDepth = perspectiveFocusDistance;
        }
        else if (focusMode == FocusMode.TargetObject && target != null)
        {
            Vector3 sp = cam.WorldToScreenPoint(target.position);
            focusScreen = new Vector2(sp.x, sp.y);
            focusDepth = Vector3.Dot(target.position - cam.transform.position, cam.transform.forward);
        }

        // Zoom se pehle: focus point ke neeche world mein kya hai
        Plane plane = new Plane(-cam.transform.forward,
                                cam.transform.position + cam.transform.forward * focusDepth);
        Vector3 before = ScreenToWorld(focusScreen, plane);

        ApplyZoom();

        // Zoom ke baad: wo point hila hai, camera ko utna wapas shift karo
        Vector3 after = ScreenToWorld(focusScreen, plane);
        cam.transform.position += before - after;
    }

    void ApplyZoom()
    {
        if (cam.orthographic)
            cam.orthographicSize = Mathf.Lerp(sizeZoomOut, sizeZoomIn, currentValue);
        else
            cam.fieldOfView = Mathf.Lerp(fovZoomOut, fovZoomIn, currentValue);
    }

    Vector3 ScreenToWorld(Vector2 screenPos, Plane plane)
    {
        Ray ray = cam.ScreenPointToRay(screenPos);

        if (cam.orthographic) return ray.origin;

        if (plane.Raycast(ray, out float dist)) return ray.GetPoint(dist);
        return ray.GetPoint(focusDepth);
    }
}
