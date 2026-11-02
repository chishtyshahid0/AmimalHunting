
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;

public class PausePanelAnimation : MonoBehaviour
{
    [Header("Pause Panel")]
    public GameObject pausePanel;
    public CanvasGroup canvasGroup;
    public RectTransform panelTransform;

    [Header("Buttons")]
    public Button resumeButton;
    public Button retryButton;
    public Button homeButton;

    [Header("Animation")]
    public float animationDuration = 0.4f;
    public float pulseSpeed = 2f;
    public float pulseAmount = 0.04f;

    private Vector3 originalScale;
    private Vector3 resumeScale;
    private bool isAnimating;
    private bool isPaused;

    void Awake()
    {
        if (panelTransform == null)
            panelTransform = pausePanel.GetComponent<RectTransform>();

        if (canvasGroup == null)
            canvasGroup = pausePanel.GetComponent<CanvasGroup>();

        if (canvasGroup == null)
            canvasGroup = pausePanel.AddComponent<CanvasGroup>();

        originalScale = panelTransform.localScale;

        if (resumeButton != null)
        {
            resumeScale = resumeButton.transform.localScale;
            resumeButton.onClick.AddListener(ResumeGame);
        }

        if (retryButton != null)
            retryButton.onClick.AddListener(RetryGame);

        if (homeButton != null)
            homeButton.onClick.AddListener(Home);

        pausePanel.SetActive(false);
    }

    void Update()
    {
        if (isPaused && !isAnimating && resumeButton != null)
        {
            float pulse = 1f +
                Mathf.Sin(Time.unscaledTime * pulseSpeed) * pulseAmount;

            resumeButton.transform.localScale = resumeScale * pulse;
        }
    }

    public void OpenPausePanel()
    {
        if (isPaused || isAnimating)
            return;

        StartCoroutine(OpenAnimation());
    }

    IEnumerator OpenAnimation()
    {
        isAnimating = true;
        isPaused = true;

        Time.timeScale = 0f;

        pausePanel.SetActive(true);
        canvasGroup.alpha = 0f;
        canvasGroup.interactable = false;
        canvasGroup.blocksRaycasts = false;

        panelTransform.localScale = originalScale * 0.7f;

        float time = 0f;

        while (time < animationDuration)
        {
            time += Time.unscaledDeltaTime;

            float t = Mathf.Clamp01(time / animationDuration);
            float smooth = 1f - Mathf.Pow(1f - t, 3f);

            canvasGroup.alpha = smooth;

            panelTransform.localScale = Vector3.Lerp(
                originalScale * 0.7f,
                originalScale,
                smooth
            );

            yield return null;
        }

        canvasGroup.alpha = 1f;
        panelTransform.localScale = originalScale;

        canvasGroup.interactable = true;
        canvasGroup.blocksRaycasts = true;

        isAnimating = false;
    }

    public void ResumeGame()
    {
        if (!isPaused || isAnimating)
            return;

        StartCoroutine(CloseAnimation());
    }

    IEnumerator CloseAnimation()
    {
        isAnimating = true;

        canvasGroup.interactable = false;
        canvasGroup.blocksRaycasts = false;

        float time = 0f;
        float startAlpha = canvasGroup.alpha;
        Vector3 startScale = panelTransform.localScale;

        while (time < animationDuration)
        {
            time += Time.unscaledDeltaTime;

            float t = Mathf.Clamp01(time / animationDuration);

            canvasGroup.alpha = Mathf.Lerp(startAlpha, 0f, t);

            panelTransform.localScale = Vector3.Lerp(
                startScale,
                originalScale * 0.7f,
                t
            );

            yield return null;
        }

        pausePanel.SetActive(false);

        panelTransform.localScale = originalScale;
        canvasGroup.alpha = 1f;

        Time.timeScale = 1f;
        isPaused = false;
        isAnimating = false;
    }

    public void RetryGame()
    {
        Time.timeScale = 1f;

        SceneManager.LoadScene(
            SceneManager.GetActiveScene().buildIndex
        );
    }

    public void Home()
    {
        Time.timeScale = 1f;

        // Apne Main Menu scene ka exact naam likho.
        SceneManager.LoadScene("MainMenu");
    }
}
