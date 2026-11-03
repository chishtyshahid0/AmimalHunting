using UnityEngine;
using UnityEngine.UI;

public class RateBtnHandler : MonoBehaviour
{
	private void OnEnable()
	{
		RatePage.RateSuccessCallBack += SuccessCallBack;
	}

	private void OnDisable()
	{
		RatePage.RateSuccessCallBack -= SuccessCallBack;
	}

	private void Start()
	{
		if (PlayerPrefs.GetString("IsRated", "false") == "true")
		{
			base.gameObject.GetComponent<Button>().interactable = false;
			return;
		}
		base.gameObject.GetComponent<Button>().interactable = true;
		base.gameObject.GetComponent<Button>().onClick.AddListener(delegate
		{
			RateClicked();
		});
	}

	public void RateClicked()
	{
		//AdManager.instance.ShowRatePopUp();
	}

	public void SuccessCallBack()
	{
		Debug.Log("-------------- InAppSuccessCallBack");
		base.gameObject.GetComponent<Button>().interactable = false;
	}

	public void FailCallBack()
	{
		Debug.Log("-------------- InAppFailedCallBack");
		base.gameObject.GetComponent<Button>().interactable = true;
	}
}
