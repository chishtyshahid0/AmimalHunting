using UnityEngine;
using UnityEngine.UI;

public class CrossFade : MonoBehaviour
{
	public float duration = 0.5f;

	public float delayTime;

	public bool loop;

	private void OnEnable()
	{
		if ((bool)GetComponent<Text>())
		{
			GetComponent<Text>().CrossFadeAlpha(0f, 0f, ignoreTimeScale: true);
		}
		else if ((bool)GetComponent<Image>())
		{
			GetComponent<Image>().CrossFadeAlpha(0f, 0f, ignoreTimeScale: true);
		}
		Invoke("FadeIn", delayTime);
	}

	private void Start()
	{
	}

	public void FadeIn()
	{
		if ((bool)GetComponent<Text>())
		{
			GetComponent<Text>().CrossFadeAlpha(0f, 0f, ignoreTimeScale: true);
		}
		else if ((bool)GetComponent<Image>())
		{
			GetComponent<Image>().CrossFadeAlpha(1f, duration, ignoreTimeScale: true);
		}
		if (loop)
		{
			Invoke("FadeOut", duration);
		}
	}

	private void FadeOut()
	{
		if ((bool)GetComponent<Text>())
		{
			GetComponent<Text>().CrossFadeAlpha(0f, 0f, ignoreTimeScale: true);
		}
		else if ((bool)GetComponent<Image>())
		{
			GetComponent<Image>().CrossFadeAlpha(0f, duration, ignoreTimeScale: true);
		}
		Invoke("FadeIn", duration);
	}

	public void FadeOutEnd()
	{
		GetComponent<Image>().CrossFadeAlpha(0f, duration, ignoreTimeScale: true);
	}

	private void OnDisable()
	{
		if ((bool)GetComponent<Text>())
		{
			GetComponent<Text>().CrossFadeAlpha(1f, duration, ignoreTimeScale: true);
		}
		else if ((bool)GetComponent<Image>())
		{
			GetComponent<Image>().CrossFadeAlpha(1f, duration, ignoreTimeScale: true);
		}
	}
}
