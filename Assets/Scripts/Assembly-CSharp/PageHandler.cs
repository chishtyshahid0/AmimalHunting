using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
using System.Collections;
public class PageHandler : MonoBehaviour
{
	public enum pageTypeEnum
	{
		menu,
		upgradeGuns,
		ModeSelection
	}

	public static PageHandler _instance;

	public pageTypeEnum pageType;

    public Text LockedTxt;

	public GameObject FpsGarbage,LockedPanel, exitPage, menuPage,ModesPanel,EnvSelectPanel;

	public GameObject upgradeGunsPage;

	public GameObject levelSelectionPage;

	public GameObject StorePage, StorePageUnlockGuns, StorePageUnlockLevels, StorePageNoAds;

	public GameObject settingsPages;

	public GameObject gunsUpgrade_Set;

	public static bool isGameManager;

    public Text[] CoinsTxt;

	private void Awake()
	{
        Time.timeScale = 1;
		SetPlayerPrefs();
		_instance = this;
		Debug.Log("CameFromIngame__" + isGameManager);
        if (isGameManager)
        {
            Open_LevelSelection();
        }
        else
        {
            Open_Store();
        }
        playercontroller.cameFromMenu = true;
	}

	private void Start()
	{
        AudioClipManager.Instance.Play(0);
        StartCoroutine("FPS_checking");
    }
    public void MoreGames()
    {
       // Adscaller.instance.moreapps_Link();
    }
    public void RateUs()
    {
      //  Adscaller.instance.rateus_Link();
    }
    public void PrivacyPolicy()
    {
        Application.OpenURL("https://gamezappstudio.blogspot.com/");
    }
    private void Update()
    {
        for(int x=0;x< CoinsTxt.Length;x++)
            CoinsTxt[x].text = PlayerPrefs.GetInt(GameEnum.totalCoins).ToString();
    }
    public void OpenThis_Panel(GameObject obj)
    {
        AudioClipManager.Instance.Play(0);
        CloseAllPages();
        obj.SetActive(true);
    }
    private void CloseAllPages()
    {
        EnvSelectPanel.SetActive(false);
        ModesPanel.SetActive(false);
        menuPage.SetActive(false);
        exitPage.SetActive(false);
        levelSelectionPage.SetActive(false);
        StorePage.SetActive(false);
        StorePageUnlockGuns.SetActive(false);
        StorePageUnlockLevels.SetActive(false);
        StorePageNoAds.SetActive(false);
        settingsPages.SetActive(false);
		upgradeGunsPage.SetActive(false);
		gunsUpgrade_Set.SetActive(false);
	}
    public void DeleteKeysAll()
    {
        AudioClipManager.Instance.Play(1);
        PlayerPrefs.DeleteAll();
        YesBtn_Exit();
    }
    public void YesBtn_Exit()
    {
        AudioClipManager.Instance.Play(1);
        Application.Quit();
    }
    public void Open_ExitPanel()
    {
        AudioClipManager.Instance.Play(1);
        CloseAllPages();
        exitPage.SetActive(true);
        //Adscaller.instance.on_exit_AD();
    }
    public void Open_Menu()
	{
		AudioClipManager.Instance.Play(1);
		CloseAllPages();
		menuPage.SetActive(true);
    }
    public void Open_EnvSelectionPanel()
    {
        AudioClipManager.Instance.Play(1);
        CloseAllPages();
        EnvSelectPanel.SetActive(true);
    }
  //  public void Open_ModeSelection()
    public void Open_ModeSelection()
    {
        AudioClipManager.Instance.Play(1);
        CloseAllPages();
        pageType = pageTypeEnum.ModeSelection;
        StorePageUnlockLevels.SetActive(true);
    }
    public void Open_UpgradeGuns()
	{
		AudioClipManager.Instance.Play(1);
		CloseAllPages();
        pageType = pageTypeEnum.upgradeGuns;
        StorePageUnlockGuns.SetActive(true);
    }

	public void Open_LevelSelection()
	{
		AudioClipManager.Instance.Play(1);
		CloseAllPages();
        levelSelectionPage.SetActive(true);
    }

	public void Open_Store()
	{
		AudioClipManager.Instance.Play(1);
		CloseAllPages();
        StorePage.SetActive(true);
	}

	public void Close_Store()
	{
		AudioClipManager.Instance.Play(1);
        CloseAllPages();
		if (pageType == pageTypeEnum.ModeSelection)
		{
			//Debug.Log("levelselection");
            //Open_LevelSelection();
            ModesPanel.SetActive(true);
        }
		else if (pageType == pageTypeEnum.menu)
		{
			//Debug.Log("menu");
            menuPage.SetActive(true);
        }
        else if (pageType == pageTypeEnum.upgradeGuns)
		{
			//Debug.Log("Upgrade");
            //Open_UpgradeGuns();
            gunsUpgrade_Set.SetActive(true);
            upgradeGunsPage.SetActive(true);
        }
    }

	public void Open_Settings()
	{
		AudioClipManager.Instance.Play(1);
		CloseAllPages();
		settingsPages.SetActive(true);
	}

	public void Close_Settings()
	{
        //AudioClipManager.Instance.Play(1);
        //CloseAllPages();
        //menuPage.SetActive(true);
        Close_Store();
    }

    private void SetPlayerPrefs()
	{
		if (!PlayerPrefs.HasKey(GameEnum.totalCoins))
		{
			PlayerPrefs.SetInt(GameEnum.totalCoins, 0);
		}
		if (!PlayerPrefs.HasKey(GameEnum.gunPurchased))
		{
			PlayerPrefs.SetString(GameEnum.gunPurchased, "1000000000");
		}
		if (!PlayerPrefs.HasKey(GameEnum.levelUnlocked))
		{
			PlayerPrefs.SetInt(GameEnum.levelUnlocked, 1);
			Debug.Log("totalLevelsStartSet::" + PlayerPrefs.GetInt(GameEnum.levelUnlocked));
		}
	}
    IEnumerator FPS_checking()
    {
        if (PlayerPrefs.GetInt("GM_FPS_D", 0) == 0)
        {
            FpsGarbage.SetActive(true);
        }
        yield return new WaitForSecondsRealtime(15f);
        FpsGarbage.SetActive(false);
    }
    public void showvideo()
    {
        //MainAdsManagerController.instance.removeall_rewardevent();
        //MainAdsManagerController.videocomplete += increasetext;
        //MainAdsManagerController.instance.show_AD_Video();
    }

    void increasetext(object sender, System.EventArgs e)
    {
        PlayerPrefs.SetInt(GameEnum.totalCoins, PlayerPrefs.GetInt(GameEnum.totalCoins) + 100);
        //MainAdsManagerController.instance.removeall_rewardevent();
    }
}
