using UnityEngine;
using UnityEngine.Rendering.PostProcessing;
using System.Collections;

public class GameplayLightTransition : MonoBehaviour
{
    [Header("Directional Light")]
    public Light directionalLight;
    public float startIntensity = 0.45f;
    public float finalIntensity = 0.85f;
    [Range(0f, 1f)]
    public float shadowStrength = 0.55f;

    [Header("Post Processing")]
    public PostProcessVolume postProcessVolume;
    public float startExposure = -0.6f;
    public float finalExposure = 0.15f;

    [Header("Skybox Material Exposure")]
    public float skyboxStartExposure = 0.45f;
    public float skyboxFinalExposure = 0.85f;

    [Header("Fog Settings (Natural Forest Fog)")]
    public Color startFogColor = new Color(0.38f, 0.42f, 0.39f, 1f);
    public Color finalFogColor = new Color(0.60f, 0.64f, 0.61f, 1f);

    public float startFogDensity = 0.0035f;
    public float finalFogDensity = 0.0018f;

    [Header("Ambient Lighting (Soft & Natural)")]
    public Color ambientSkyColor = new Color(0.50f, 0.54f, 0.52f, 1f);
    public Color ambientEquatorColor = new Color(0.38f, 0.42f, 0.37f, 1f);
    public Color ambientGroundColor = new Color(0.22f, 0.25f, 0.20f, 1f);

    [Header("Image Fade Out")]
    public CanvasGroup imageCanvasGroup;
    public Animator imageAnimator;
    public float imageFadeDuration = 2.0f;

    [Header("Transition")]
    public float duration = 2.5f;

    private ColorGrading colorGrading;
    private Material skyboxMaterial;

    private void Start()
    {
        if (directionalLight == null ||
            postProcessVolume == null ||
            postProcessVolume.profile == null)
        {
            Debug.LogWarning(
                "Assign Directional Light and Post Process Volume.");
            return;
        }

        postProcessVolume.profile =
            Instantiate(postProcessVolume.profile);

        if (!postProcessVolume.profile.TryGetSettings(
            out colorGrading))
        {
            Debug.LogWarning(
                "Color Grading is missing from the Profile.");
            return;
        }

        if (!colorGrading.enabled)
        {
            Debug.LogWarning("Enable Color Grading.");
            return;
        }

        skyboxMaterial = RenderSettings.skybox;

        if (skyboxMaterial == null ||
            !skyboxMaterial.HasProperty("_Exposure"))
        {
            Debug.LogWarning(
                "Skybox Material has no _Exposure property.");
            skyboxMaterial = null;
        }

        directionalLight.intensity = startIntensity;
        directionalLight.shadowStrength = shadowStrength;
        directionalLight.shadows = LightShadows.Soft;

        colorGrading.postExposure.value = startExposure;

        if (skyboxMaterial != null)
        {
            skyboxMaterial.SetFloat(
                "_Exposure", skyboxStartExposure);
        }

        // Ambient Lighting setup (Naram aur natural look)
        RenderSettings.ambientMode = UnityEngine.Rendering.AmbientMode.Trilight;
        RenderSettings.ambientSkyColor = ambientSkyColor;
        RenderSettings.ambientEquatorColor = ambientEquatorColor;
        RenderSettings.ambientGroundColor = ambientGroundColor;

        RenderSettings.fog = true;
        RenderSettings.fogMode = FogMode.ExponentialSquared;
        RenderSettings.fogColor = startFogColor;
        RenderSettings.fogDensity = startFogDensity;

        // Start image fade-out and stop its Animator.
        if (imageAnimator != null)
        {
            imageAnimator.enabled = false;
        }

        if (imageCanvasGroup != null)
        {
            imageCanvasGroup.alpha = 1f;
            StartCoroutine(FadeOutImage());
        }

        StartCoroutine(SmoothTransition());
    }

    private IEnumerator FadeOutImage()
    {
        float elapsed = 0f;
        float startAlpha = imageCanvasGroup.alpha;

        while (elapsed < imageFadeDuration)
        {
            elapsed += Time.deltaTime;

            float t = imageFadeDuration > 0f
                ? Mathf.Clamp01(elapsed / imageFadeDuration)
                : 1f;

            imageCanvasGroup.alpha = Mathf.Lerp(
                startAlpha, 0f, t);

            yield return null;
        }

        imageCanvasGroup.alpha = 0f;
    }

    private IEnumerator SmoothTransition()
    {
        float elapsed = 0f;

        float initialIntensity = directionalLight.intensity;
        float initialExposure = colorGrading.postExposure.value;

        float initialSkyboxExposure = skyboxMaterial != null
            ? skyboxMaterial.GetFloat("_Exposure")
            : skyboxFinalExposure;

        float initialFogDensity = RenderSettings.fogDensity;
        Color initialFogColor = RenderSettings.fogColor;

        while (elapsed < duration)
        {
            elapsed += Time.deltaTime;

            float t = duration > 0f
                ? Mathf.Clamp01(elapsed / duration)
                : 1f;

            t = t * t * (3f - 2f * t);

            directionalLight.intensity = Mathf.Lerp(
                initialIntensity, finalIntensity, t);

            colorGrading.postExposure.value = Mathf.Lerp(
                initialExposure, finalExposure, t);

            if (skyboxMaterial != null)
            {
                skyboxMaterial.SetFloat(
                    "_Exposure",
                    Mathf.Lerp(
                        initialSkyboxExposure,
                        skyboxFinalExposure, t));
            }

            RenderSettings.fogDensity = Mathf.Lerp(
                initialFogDensity, finalFogDensity, t);

            RenderSettings.fogColor = Color.Lerp(
                initialFogColor, finalFogColor, t);

            yield return null;
        }

        directionalLight.intensity = finalIntensity;
        colorGrading.postExposure.value = finalExposure;
        RenderSettings.fogDensity = finalFogDensity;
        RenderSettings.fogColor = finalFogColor;

        if (skyboxMaterial != null)
        {
            skyboxMaterial.SetFloat(
                "_Exposure", skyboxFinalExposure);
        }
    }

    public void OnStartHuntingClick()
    {
        StopAllCoroutines();

        // Play image fade animation.
        if (imageAnimator != null)
        {
            imageAnimator.enabled = true;
            imageAnimator.Play(0, 0, 0f);
        }

        // Smoothly transition all lighting to final values.
        StartCoroutine(SmoothTransition());

        // Har zinda animal par red indicator dot show karo
        AnimalTargetIndicatorManager.StartHunting();
    }
}