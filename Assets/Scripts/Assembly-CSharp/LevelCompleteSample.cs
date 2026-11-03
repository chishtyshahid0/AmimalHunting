using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LevelCompleteSample : MonoBehaviour
{
	public static LevelCompleteSample instance;

	public GameObject PopUp;

	public Text CoinsTxt;

	private int LvlCompleteCoins = 1000;

	public GameObject DoubleRewardBtn;

	public int score = 1000;

	private void Awake()
	{
		instance = this;
		base.gameObject.SetActive(false);
	}

	public void Open()
	{
		base.gameObject.SetActive(true);
		CoinsTxt.text = "Reward:" + LvlCompleteCoins;
		PopUp.transform.localPosition = Vector3.zero;
		iTween.MoveFrom(PopUp, iTween.Hash("y", 1000, "time", 0.4f, "islocal", true, "easetype", iTween.EaseType.spring));
		//AdManager.instance.RunActions(AdManager.PageType.LC, InGameSample.CurrentLvl, score);
	}

	public void Close()
	{
		SceneManager.LoadScene("MenuSample");
	}

	public void RetryBtnClick()
	{
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}

	public void NextBtnClick()
	{
		InGameSample.CurrentLvl++;
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}

	public void WatchVideoDoubleReward()
	{
		//AdManager.instance.ShowRewardVideoWithCallback(delegate
		//{
		//	LvlCompleteCoins *= 2;
		//	CoinsTxt.text = "Reward:" + LvlCompleteCoins;
		//	Debug.Log("------ Menu Watched video successfully");
		//});
	}
}
