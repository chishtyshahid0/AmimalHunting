using UnityEngine;
using UnityEngine.UI;

public class RatePage : MonoBehaviour
{
	public delegate void RateSuccessCheck();

	public static RatePage instance;

	public GameObject PopUp;

	public GameObject[] FillStars;

	public GameObject RateBtn;

	public GameObject ThankYouBtn;

	public Text Desc;

	public static event RateSuccessCheck RateSuccessCallBack;

	private void Awake()
	{
		instance = this;
		base.gameObject.SetActive(false);
	}

	public void Open()
	{
		base.gameObject.SetActive(true);
		for (int i = 0; i < FillStars.Length; i++)
		{
			FillStars[i].SetActive(false);
		}
		ThankYouBtn.SetActive(false);
		RateBtn.SetActive(false);
		//if (AdManager.instance.RateDesc != string.Empty)
		//{
		//	Desc.text = AdManager.instance.RateDesc;
		//}
		PopUp.transform.localPosition = Vector3.zero;
		iTween.MoveFrom(PopUp, iTween.Hash("y", 1000, "time", 0.4f, "islocal", true, "easetype", iTween.EaseType.spring));
	}

	public void Close()
	{
		base.gameObject.SetActive(false);
	}

	public void StarClick(int StarCount)
	{
		RateBtn.SetActive(false);
		ThankYouBtn.SetActive(false);
		for (int i = 0; i < FillStars.Length; i++)
		{
			if (i < StarCount)
			{
				FillStars[i].SetActive(true);
			}
		}
		if (StarCount > 3)
		{
			RateBtn.SetActive(true);
		}
		else
		{
			ThankYouBtn.SetActive(true);
		}
	}

	public void ThankYouClick()
	{
		PlayerPrefs.SetString("IsRated", "true");
		if (RatePage.RateSuccessCallBack != null)
		{
			RatePage.RateSuccessCallBack();
		}
		Close();
	}

	public void RateClick()
	{
		PlayerPrefs.SetString("IsRated", "true");
		//Application.OpenURL("market://details?id=" + Application.bundleIdentifier);
		//if (AdManager.instance.RateCoins > 0)
		//{
		//	AdManager.instance.StartCoroutine(AdManager.instance.AddCoinsWithDelay(2f, AdManager.instance.RateCoins, AdManager.RewardDescType.Rating));
		//}
		if (RatePage.RateSuccessCallBack != null)
		{
			RatePage.RateSuccessCallBack();
		}
		Close();
	}
}
