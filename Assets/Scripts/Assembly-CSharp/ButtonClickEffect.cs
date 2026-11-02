using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class ButtonClickEffect : MonoBehaviour, IPointerUpHandler, IPointerDownHandler, IEventSystemHandler
{
	private Image _img;

	private void Start()
	{
		_img = GetComponent<Image>();
	}

	public IEnumerator FillEffect(float fromVal, float to, float time, float delay, iTween.EaseType _ease)
	{
		if ((bool)_img)
		{
			iTween.ValueTo(base.gameObject, iTween.Hash("from", fromVal, "to", to, "time", time, "easetype", _ease, "onupdate", "changeVal", "onupdatetarget", base.gameObject));
		}
		yield return new WaitForEndOfFrame();
	}

	public void changeVal(float val)
	{
		_img.fillAmount = val;
	}

	public void OnPointerDown(PointerEventData eventData)
	{
		if (!base.gameObject.GetComponent<iTween>() && GetComponent<Image>().raycastTarget)
		{
			iTween.PunchScale(base.gameObject, iTween.Hash("y", 0.5f, "time", 0.2f));
		}
	}

	public void OnPointerUp(PointerEventData eventData)
	{
	}
}
