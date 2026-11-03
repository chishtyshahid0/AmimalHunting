using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Rendering.PostProcessing;
using System.Collections;

/// <summary>
/// ThermalToggle  —  Built-in RP + PostProcessing Stack v2
///
/// Kya karta hai:
///   - Pehli click : Dedicated thermal PostProcessVolume weight=1 par aata hai.
///                   Purple / yellow / high-contrast night-vision look on hota hai.
///   - Doosri click: Volume weight=0 (normal look restore).
///
/// Kya NAHI karta:
///   - GameplayLightTransition.cs ka volume kabhi nahi chhoota.
///   - Hunting logic, indicators, fog nahi chhoota.
///
/// Setup:
///   1. Is script ko kisi bhi GameObject par attach karo.
///   2. "Toggle Button" field mein apna UI Button drag karo.
///   3. Play — baki sab runtime mein auto-create hota hai.
/// </summary>
public class ThermalToggle : MonoBehaviour
{
    // ── Inspector ─────────────────────────────────────────────────
    [Header("UI")]
    [Tooltip("Thermal toggle karne wala button.")]
    public Button toggleButton;

    [Header("Button Colors")]
    public Color onColor  = new Color(0.55f, 0.20f, 0.90f, 1f);  // purple-violet (ON)
    public Color offColor = new Color(1f,    1f,    1f,    1f);   // white         (OFF)

    [Header("Transition")]
    [Range(0f, 1f)]
    [Tooltip("Seconds mein effect ka smooth fade.")]
    public float fadeDuration = 0.35f;

    // ── Private ───────────────────────────────────────────────────
    private PostProcessVolume thermalVolume;
    private ColorGrading      colorGrading;   // channel mixer bhi isi ke andar hai PPv2 mein
    private Vignette          vignette;
    private Grain             grain;          // PPv2 ka sahi class (FilmGrain nahi)

    private bool  isThermalOn   = false;
    private float currentWeight = 0f;

    private Graphic    btnGraphic;
    private Coroutine  fadeCoroutine;

    // ── Awake ─────────────────────────────────────────────────────

    private void Awake()
    {
        BuildThermalVolume();
        SetupButton();
        SetButtonVisual(false);
    }

    /// <summary>
    /// Runtime mein dedicated PostProcessVolume + effects banata hai.
    /// Existing GameplayLightTransition volume se ALAG — usse kabhi touch nahi karta.
    /// </summary>
    private void BuildThermalVolume()
    {
        // --- Volume GameObject ---
        GameObject volObj = new GameObject("_ThermalPostVolume");
        DontDestroyOnLoad(volObj);

        thermalVolume          = volObj.AddComponent<PostProcessVolume>();
        thermalVolume.isGlobal = true;
        thermalVolume.priority = 100;   // existing volumes se upar
        thermalVolume.weight   = 0f;    // shuru mein off

        PostProcessProfile profile = ScriptableObject.CreateInstance<PostProcessProfile>();
        thermalVolume.sharedProfile = profile;

        // ── Color Grading (channel mixer bhi isi mein hai PPv2 mein) ──
        colorGrading = profile.AddSettings<ColorGrading>();
        colorGrading.enabled.Override(true);
        colorGrading.gradingMode.Override(GradingMode.HighDefinitionRange);

        // Exposure + contrast
        colorGrading.postExposure.Override(1.3f);
        colorGrading.contrast.Override(35f);

        // Cool blue-purple temperature
        colorGrading.temperature.Override(-28f);
        colorGrading.tint.Override(42f);

        // Vivid saturation
        colorGrading.saturation.Override(85f);

        // ── Channel Mixer (ColorGrading ke fields — PPv2 style) ──────
        // Red output → boost red + blue (purplish reds)
        colorGrading.mixerRedOutRedIn.Override(60f);
        colorGrading.mixerRedOutGreenIn.Override(-10f);
        colorGrading.mixerRedOutBlueIn.Override(70f);

        // Green output → warm yellows / oranges
        colorGrading.mixerGreenOutRedIn.Override(50f);
        colorGrading.mixerGreenOutGreenIn.Override(40f);
        colorGrading.mixerGreenOutBlueIn.Override(-20f);

        // Blue output → purple-violet shadows
        colorGrading.mixerBlueOutRedIn.Override(40f);
        colorGrading.mixerBlueOutGreenIn.Override(-20f);
        colorGrading.mixerBlueOutBlueIn.Override(70f);

        // ── Vignette (dark edges, cinematic feel) ─────────────────
        vignette = profile.AddSettings<Vignette>();
        vignette.enabled.Override(true);
        vignette.intensity.Override(0.48f);
        vignette.smoothness.Override(0.65f);
        vignette.color.Override(new Color(0.18f, 0.0f, 0.32f));  // dark purple edge

        // ── Grain (PPv2 class — FilmGrain URP mein hota hai) ───────
        grain = profile.AddSettings<Grain>();
        grain.enabled.Override(true);
        grain.colored.Override(true);
        grain.intensity.Override(0.42f);
        grain.size.Override(1f);
        grain.lumContrib.Override(0.8f);
    }

    // ── Button Setup ──────────────────────────────────────────────

    private void SetupButton()
    {
        if (toggleButton == null)
            toggleButton = GetComponent<Button>();

        if (toggleButton != null)
        {
            btnGraphic = toggleButton.targetGraphic;
            toggleButton.onClick.AddListener(OnToggleClicked);
        }
    }

    private void OnDestroy()
    {
        if (toggleButton != null)
            toggleButton.onClick.RemoveListener(OnToggleClicked);

        if (thermalVolume != null && thermalVolume.gameObject != null)
            Destroy(thermalVolume.gameObject);
    }

    // ── Toggle ────────────────────────────────────────────────────

    public void OnToggleClicked()
    {
        isThermalOn = !isThermalOn;

        if (fadeCoroutine != null)
            StopCoroutine(fadeCoroutine);

        fadeCoroutine = StartCoroutine(FadeVolume(isThermalOn ? 1f : 0f));
        SetButtonVisual(isThermalOn);
    }

    private IEnumerator FadeVolume(float targetWeight)
    {
        float startWeight = currentWeight;
        float elapsed     = 0f;
        float duration    = Mathf.Max(fadeDuration, 0.001f);

        while (elapsed < duration)
        {
            elapsed += Time.unscaledDeltaTime;
            float t = Mathf.SmoothStep(0f, 1f, elapsed / duration);
            currentWeight = Mathf.Lerp(startWeight, targetWeight, t);
            thermalVolume.weight = currentWeight;
            yield return null;
        }

        currentWeight        = targetWeight;
        thermalVolume.weight = currentWeight;
    }

    // ── Button Visual ─────────────────────────────────────────────

    private void SetButtonVisual(bool isOn)
    {
        if (btnGraphic == null) return;
        btnGraphic.color = isOn ? onColor : offColor;
    }
}
