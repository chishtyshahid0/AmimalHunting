using UnityEngine;
using UnityEngine.UI;

public class MenuAdPage : MonoBehaviour
{
	public Image MenuAdImg;

	public GameObject CloseBtn;

	public static MenuAdPage instance;

	private void Awake()
	{
		instance = this;
		base.gameObject.SetActive(false);
	}

	public void Open()
	{
		//Invoke("showMenuAd", AdManager.instance.menuAdDelay);
	}

	private void showMenuAd()
	{
		base.gameObject.SetActive(true);
		MenuAdImg.CrossFadeAlpha(1f, 1f, ignoreTimeScale: true);
		CloseBtn.transform.localScale = Vector3.one;
		iTween.ScaleFrom(CloseBtn, iTween.Hash("x", 0, "y", 0, "time", 0.4f, "delay", 2.5f, "easetype", iTween.EaseType.spring));
	}

	public void Close()
	{
		base.gameObject.SetActive(false);
	}

	public void MenuAdClick()
	{
		//Debug.Log("MenuAdLink=" + AdManager.instance.MenuAdLinkTo);
		//Application.OpenURL(AdManager.instance.MenuAdLinkTo);
		Close();
	}

	public void SetMenuAdTexture()
	{
		//MenuAdImg.GetComponent<Image>().sprite = AdManager.instance.menuAdImg;
	}
}
