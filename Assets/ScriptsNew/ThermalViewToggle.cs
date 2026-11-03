using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// ThermalViewToggle:
/// - Ek UI Button se thermal/night-vision look ko toggle karta hai.
/// - Pehli click par: Camera par CameraFilterPack_Gradients_Therma effect ON hota hai (purple-yellow thermal look).
/// - Doosri click par: Effect OFF hota hai (normal look wapas).
/// - Button ka visual state (icon tint ya background) clearly change hota hai.
///
/// Setup:
/// 1. Is script ko kisi bhi GameObject par attach karo (jaise UI Button).
/// 2. Inspector mein 'Toggle Button' field mein apna UI Button drag karo.
/// 3. (Optional) thermalOnColor / thermalOffColor se button ka tint set karo.
///
/// Scope:
/// - Sirf camera par ek CameraFilterPack component add/enable/disable karta hai.
/// - GameplayLightTransition, AnimalTargetIndicatorManager, hunting logic ko nahi chhoota.
/// </summary>
public class ThermalViewToggle : MonoBehaviour
{
    [Header("UI Button")]
    [Tooltip("Wo Button jis par click se thermal toggle hota hai.")]
    public Button toggleButton;

    [Header("Button Visual State")]
    [Tooltip("Button active hone par graphic ka tint color.")]
    public Color thermalOnColor = new Color(0.55f, 0.22f, 0.88f, 1f);   // purple-violet

    [Tooltip("Button inactive (normal) hone par graphic ka tint color.")]
    public Color thermalOffColor = new Color(1f, 1f, 1f, 1f);           // white (default)

    // ---- private state ----
    private bool isThermalOn = false;
    private CameraFilterPack_Gradients_Therma thermalComponent;
    private Graphic buttonGraphic;   // Image ya Text jo tint lega

    // -------------------------------------------------------

    private void Awake()
    {
        // Button ki graphic dhundho (tint ke liye)
        if (toggleButton != null)
        {
            buttonGraphic = toggleButton.targetGraphic;

            // Button click event register karo
            toggleButton.onClick.AddListener(OnToggleClicked);
        }
        else
        {
            // Agar button assign nahi, khud ko Button component se dhundho
            toggleButton = GetComponent<Button>();
            if (toggleButton != null)
            {
                buttonGraphic = toggleButton.targetGraphic;
                toggleButton.onClick.AddListener(OnToggleClicked);
            }
        }

        // Shuru mein normal state set karo
        SetButtonVisual(false);
    }

    private void OnDestroy()
    {
        if (toggleButton != null)
            toggleButton.onClick.RemoveListener(OnToggleClicked);
    }

    /// <summary>
    /// Button click par yeh function call hota hai.
    /// </summary>
    public void OnToggleClicked()
    {
        isThermalOn = !isThermalOn;

        if (isThermalOn)
            EnableThermal();
        else
            DisableThermal();

        SetButtonVisual(isThermalOn);
    }

    // -------------------------------------------------------
    //  Effect Enable / Disable
    // -------------------------------------------------------

    private void EnableThermal()
    {
        Camera cam = Camera.main;
        if (cam == null)
        {
            Debug.LogWarning("[ThermalViewToggle] Camera.main nahi mila.");
            return;
        }

        // Component pehle se hai ya nahi check karo
        thermalComponent = cam.GetComponent<CameraFilterPack_Gradients_Therma>();

        if (thermalComponent == null)
        {
            // Component nahi hai to nayi add karo
            thermalComponent = cam.gameObject.AddComponent<CameraFilterPack_Gradients_Therma>();
        }

        // Full effect ke liye Fade = 1
        thermalComponent.Fade   = 1f;
        thermalComponent.Switch = 1f;
        thermalComponent.enabled = true;
    }

    private void DisableThermal()
    {
        if (thermalComponent == null)
        {
            Camera cam = Camera.main;
            if (cam != null)
                thermalComponent = cam.GetComponent<CameraFilterPack_Gradients_Therma>();
        }

        if (thermalComponent != null)
        {
            thermalComponent.enabled = false;
        }
    }

    // -------------------------------------------------------
    //  Button Visual State
    // -------------------------------------------------------

    private void SetButtonVisual(bool isOn)
    {
        if (buttonGraphic == null) return;

        buttonGraphic.color = isOn ? thermalOnColor : thermalOffColor;
    }
}
