using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LevelSelectionSample : MonoBehaviour
{
	public static LevelSelectionSample instance;

	public Text CoinsTxt;

	private void Awake()
	{
		instance = this;
	}

	private void Start()
	{
		CoinsTxt.text = "Coins:" + PlayerPrefs.GetInt("MyCoins", 100);
		//AdManager.instance.RunActions(AdManager.PageType.LvlSelection);
	}

	public void BackClick()
	{
		SceneManager.LoadScene("MenuSample");
	}

	public void LevelClick(int LvlIndex)
	{
		InGameSample.CurrentLvl = LvlIndex;
		SceneManager.LoadScene("UpgradeSample");
	}

	public void UnlockAllClick()
	{
	}

	public void StoreClick()
	{
		StoreSample.instance.Open();
	}

	public void WatchVideo()
	{
		//AdManager.instance.ShowRewardVideo();
	}

	public void AddCoins(int value)
	{
		int @int = PlayerPrefs.GetInt("MyCoins", 100);
		@int += value;
		PlayerPrefs.SetInt("MyCoins", @int);
		CoinsTxt.text = "Coins:" + @int;
		Debug.Log("------ Menu Watched video successfully");
	}
}
