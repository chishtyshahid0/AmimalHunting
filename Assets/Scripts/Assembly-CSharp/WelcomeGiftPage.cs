using UnityEngine;
using UnityEngine.UI;

public class WelcomeGiftPage : MonoBehaviour
{
	public static WelcomeGiftPage instance;

	public GameObject PopUp;

	public GameObject ClaimBtn;

	public Text Desc;

	private void Awake()
	{
		instance = this;
		base.gameObject.SetActive(false);
	}

	public void Open()
	{
		base.gameObject.SetActive(true);
		PopUp.transform.localPosition = Vector3.zero;
		iTween.MoveFrom(PopUp, iTween.Hash("y", 1000, "time", 0.4f, "islocal", true, "easetype", iTween.EaseType.spring));
	}

	public void Close()
	{
		base.gameObject.SetActive(false);
		//AdManager.instance.LoadFirstScene();
	}

	public void claimBtnClick()
	{
		//CallbacksController.instance.AddCoins(AdManager.instance.WelcomeGiftReward, AdManager.RewardDescType.WelcomeGift, AdManager.RewardType.WelcomeGift);
		ClaimBtn.GetComponent<Button>().interactable = false;
		Close();
	}
}
