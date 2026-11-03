using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections;
public class UIcontrol : MonoBehaviour
{
	public static bool Enableshoot;

	public static bool Enablezoom;

	public static bool CheckCrouch;

	public static bool CheckJump;

	public Image Crosshair;

	public Image Sniperscope;

	public static UIcontrol Obj;

    public static int Noofenemieskilled;

	public GameObject /*CrossBtnSuccess,CrossBtnFailed,*/ ShopPanel,Allcontrols;

	public GameObject joystick,img1,img2,Shout_button,shoot_btn_Scop;

	public GameObject arrowsObj;

	public GameObject Levelcompleteset,ComPlete_InApp,fail_inaap,FailPanels;

	public GameObject Pauseset;

	public GameObject Loadingset;

	public int Leveltarget;

	public Text hEADING,Totalkills;

	public Text Totalreward;

	public Text totalScoreTxt;

	public Text Nextbuttontext;

	public int[] LevelRewardvalues;

	public Image Healthvalue;

	public Text Targettext;

	public Image Hiteffect;

	public Sprite Bloodlevel1;

	public Sprite Bloodlevel2;

	public Sprite Bloodlevel3;

	public Sprite[] Allsniperscopes;

	public int Resumecount;

	private Tutorial _Tutorialref;

	public AudioSource Ambiencesource;

	public AudioSource Othersoundsource;

	public AudioClip[] Othersoundclips;

	public GameObject Chopperalertmessageobj;

	public GameObject Headshotobj;

	public Text helpText;

	public Text waveHelpTxt;

	public Text helpText2;

	public GameObject infraredButton;

	public Image infraredFiller;

	public GameObject watchVideoFillerBtn;

	public GameObject animalDetailsObj;

	public GameObject levelDescriptionObj;

	public Text animalNameTxt;

	public Text animalDistanceTxt;

	public Text levelDescriptionTxt;

	public Text ingameDescriptionText;

	public Text timeerText;

	public GameObject infraredBtn;

	public GameObject targetObj;

	public GameObject timerObj;

	public GameObject waveHelpObj;

	public GameObject helpObj;

	public AnimalBehaviour[] allAnimals;

	private bool startFiller;

	private float fillDicreaseAmount = 15f;

	private float timervalue = 5f;

	public bool IsTouch;

	public bool isLevelComplete;

	public bool isLevelFail;

	public bool startGame;

	private GameObject levelCameraObj;
    /// <summary>
    /// //////////////////////
    /// </summary>shou
   
    private void Awake()
	{
        Obj = this;
        Noofenemieskilled = 0;
        Enableshoot = (Enablezoom = (CheckCrouch = false));
		BGSoundManager.Instance.StopPlaying();
		GetComponent<AudioSource>().enabled = true;
	}

	public void ShootTextHelp(string str, float disableAfter = 1f)
	{
		helpText.gameObject.SetActive(true);
		helpText.text = str;
		Invoke("DisableHelptext", disableAfter);
	}

	private void DisableHelptext()
	{
		helpText.gameObject.SetActive(false);
	}

	public void ShootTextHelp2(string str, float disableAfter = 1f)
	{
		Debug.Log("help");
		helpText2.gameObject.SetActive(true);
		helpText2.text = str;
		Invoke("DisableHelptext2", disableAfter);
	}

	private void DisableHelptext2()
	{
		helpText2.gameObject.SetActive(false);
	}

	private void Start()
	{
		Sniperscope.enabled = false;
		if (Tutorial.Obj != null)
		{
			_Tutorialref = Tutorial.Obj;
		}
		Ambiencesource.Play();
		Chopperalertmessageobj.SetActive(false);
		Invoke("SetTarget", 1f);
		targetObj.SetActive(false);
	}

	public void CheckControlButtons()
	{
        if (GameManager.MODE_Hard)
        {
            if (LevelDetails._instance.isArrowsEnable)
            {
                arrowsObj.SetActive(true);
            }
            else
            {
                arrowsObj.SetActive(false);
            }
            if (LevelDetails._instance.isJoyStickEnable)
            {
                joystick.SetActive(true);
            }
            else
            {
                joystick.SetActive(false);
            }
        }
        else if (GameManager.MODE_Easy || GameManager.MODE_AnimalWdNameX)//Easy Scene Hahahah
        {
            joystick.SetActive(true);
            arrowsObj.SetActive(true);
        }
        
	}

	public void InfraredBtnClick()
	{
		startFiller = true;
		AnimalBehaviour[] array = allAnimals;
		foreach (AnimalBehaviour animalBehaviour in array)
		{
			animalBehaviour.ChangeToInfreredMode();
		}
	}

	private void Update()
	{
		if (!startFiller)
		{
			return;
		}
		fillDicreaseAmount -= Time.deltaTime;
		infraredFiller.fillAmount = fillDicreaseAmount / 15f;
		if (infraredFiller.fillAmount <= 0f)
		{
			infraredBtn.SetActive(false);
			AnimalBehaviour[] array = allAnimals;
			foreach (AnimalBehaviour animalBehaviour in array)
			{
				animalBehaviour.ChangeToNormalMode();
				fillDicreaseAmount = 15f;
				startFiller = false;
			}
		}
	}



	public void WatchVideoFiller_Success()
	{
		watchVideoFillerBtn.SetActive(false);
		infraredButton.gameObject.SetActive(true);
		infraredFiller.fillAmount = 1f;
	}

	public void SetTarget()
    {
        if (GameManager.MODE_Hard)
        {
            Noofenemieskilled = LevelDetails._instance.totalTaregts - LevelDetails._instance.remainingTargets;
            Targettext.text = Noofenemieskilled + " / " + LevelDetails._instance.totalTaregts;
            Leveltarget = LevelDetails._instance.totalTaregts;
            allAnimals = Object.FindObjectsOfType(typeof(AnimalBehaviour)) as AnimalBehaviour[];
            ingameDescriptionText.text = LevelDetails._instance.levelDescription;
        }
        else if (GameManager.MODE_Easy)
        {
            Targettext.text = Noofenemieskilled + " / " + playercontroller.TotalKills;
            allAnimals = Object.FindObjectsOfType(typeof(AnimalBehaviour)) as AnimalBehaviour[];
            ingameDescriptionText.text = "Kill " + playercontroller.TotalKills + " " + LevelManager._instance.EnemyName[LevelManager._instance.TestingIndex] + " in the given time ....!";
        }
        else if (GameManager.MODE_AnimalWdNameX)
        {
            Targettext.text = Noofenemieskilled + " / " + playercontroller.TotalKills;
            allAnimals = Object.FindObjectsOfType(typeof(AnimalBehaviour)) as AnimalBehaviour[];
            ingameDescriptionText.text = "Kill " + playercontroller.TotalKills + " " + GameEnum.AnimalName + " in the given time ....!";
        }
    }

	public void Shootnow()
	{
		Enableshoot = true;
		Virtualjoystick.StoreFingerId1();
	}

	public void Stopshootnow()
	{
		Enableshoot = false;
		Virtualjoystick.Fingerid1 = -1;
		if (_Tutorialref != null && _Tutorialref.count == 2)
		{
			_Tutorialref.count = 3;
			_Tutorialref.Shootbtn.raycastTarget = false;
			_Tutorialref.Enabletexts(3);
		}
	}

	public void CheckZoomstatus()
	{
		Debug.Log("enable zoom : " + Enablezoom);
		Enablezoom = !Enablezoom;
		if (Enablezoom)
		{
			Crosshair.enabled = false;
			Sniperscope.enabled = true;
			img1.SetActive(true);
            img2.SetActive(true);
            //ShowOnTargetsAuto.Instance.ShowOnFirst();
            //Shout_button.SetActive(false);
            //shoot_btn_Scop.SetActive(true);
            Playothersoundsource(1);
			

        }
		else
		{
			Playothersoundsource(0);
			Crosshair.enabled = true;
            Sniperscope.enabled = false;
            img1.SetActive(false);
            img2.SetActive(false);
            //shoot_btn_Scop.SetActive(false);
            //Shout_button.SetActive(true);
            //ShowOnTargetsAuto.Instance.ShowOnSecond();
        }
		if (_Tutorialref != null && _Tutorialref.count == 3)
		{
			_Tutorialref.count = 4;
			_Tutorialref.Zoombtn.raycastTarget = false;
			_Tutorialref.Disablealltexts();
			_Tutorialref.Invoke("Enablezoomoutbutton", 2f);
		}
		else if (_Tutorialref != null && _Tutorialref.count == 4)
		{
			_Tutorialref.count = 5;
			_Tutorialref.Zoombtn.raycastTarget = false;
			_Tutorialref.Jumpbtn.enabled = true;
			_Tutorialref.Jumpbtn.raycastTarget = true;
			_Tutorialref.Enabletexts(7);
		}
	}

	public void CheckCrouchStatus()
	{
		CheckCrouch = !CheckCrouch;
		if (CheckCrouch)
		{
			if (playercontroller.Obj != null)
			{
				playercontroller.Obj.Playercamanim.SetTrigger("Crouchmode");
			}
			if (_Tutorialref != null && _Tutorialref.count == 6)
			{
				_Tutorialref.count = 7;
				_Tutorialref.Enabletexts(6);
			}
			Playothersoundsource(5);
			return;
		}
		if (playercontroller.Obj != null)
		{
			playercontroller.Obj.Playercamanim.SetTrigger("Normalmode");
		}
		if (_Tutorialref != null && _Tutorialref.count == 7)
		{
			_Tutorialref.count = 8;
			_Tutorialref.Enabletexts(8);
			_Tutorialref.Crouchbtn.raycastTarget = false;
			_Tutorialref.Jumpbtn.enabled = true;
			_Tutorialref.Jumpbtn.raycastTarget = true;
			_Tutorialref.Enabelallbuttons();
		}
		Playothersoundsource(6);
	}

	public void CheckJumpfunc()
	{
		if (_Tutorialref != null && _Tutorialref.count == 5)
		{
			_Tutorialref.Crouchbtn.raycastTarget = true;
			_Tutorialref.Crouchbtn.enabled = true;
			_Tutorialref.count = 6;
			_Tutorialref.Enabletexts(5);
		}
		if (CheckCrouch)
		{
			CheckCrouchStatus();
		}
		else
		{
			CheckJump = true;
		}
	}

	public void DisableJumpe()
	{
		CheckJump = false;
	}

	public void CheckTouchStart()
	{
		IsTouch = true;
	}

	public void CheckTouchEnd()
	{
		IsTouch = false;
	}

	public void Showpauseset()
	{
		Time.timeScale = 0f;
		Pauseset.SetActive(true);
	}

	public void Hidepauseset()
    {
        Time.timeScale = 1f;
        Pauseset.SetActive(false);
        Loadingset.SetActive(true);
        Invoke("DelayinHidepauseset", 2f);
     //   Adscaller.instance.on_pause_AD();
    }
    void DelayinHidepauseset()
    {
        Loadingset.SetActive(false);
    }
	public void Gotohomenow()
	{
        Time.timeScale = 1f;
        Loadingset.SetActive(true);
		AudioClipManager.Instance.Play(1);
        Invoke("DelayinGotohomenow", 2f);
       // Adscaller.instance.on_fail_sucess_commercial_AD();
    }
    void DelayinGotohomenow()
    {
        StartCoroutine(SceneLoading("MainMenu"));
    }

    public void RestartNow()
    {
        Time.timeScale = 1f;
        Loadingset.SetActive(true);
        AudioClipManager.Instance.Play(1);
        Invoke("DelayinRestartNow", 2f);
       // Adscaller.instance.on_fail_sucess_commercial_AD();
    }
    void DelayinRestartNow()
    {
        StartCoroutine(SceneLoading(SceneManager.GetActiveScene().name));
    }
    IEnumerator SceneLoading(string i)
    {
        Time.timeScale = 1f;
        yield return new WaitForSeconds(5f);
        Scene s = SceneManager.GetSceneByName(i);
        AsyncOperation AsyncScene = SceneManager.LoadSceneAsync(i);
        while (!AsyncScene.isDone)
        {
            yield return null;
        }
    }
    public static void AddCoins(int coins)
    {
        PlayerPrefs.SetInt(GameEnum.totalCoins, PlayerPrefs.GetInt(GameEnum.totalCoins) + coins);
        //Debug.Log("TotalCoins::" + PlayerPrefs.GetInt(GameEnum.totalCoins));
    }
    void TweenCoins1(float NewValue)
    {
        Totalreward.text = Mathf.RoundToInt(NewValue) + " Coins";
        sourcecoins.Play();
    }
    void TweenCoins2(float NewValue)
    {
        totalScoreTxt.text = Mathf.RoundToInt(NewValue) + " Coins";
        sourcecoins.Play();
    }
    IEnumerator CompleteDiaAnimateCoinsValue()
    {
        Nextbuttontext.transform.parent.gameObject.SetActive(false);
        Totalkills.text = Noofenemieskilled.ToString();
        int num = LevelRewardvalues[playercontroller.Obj.currentLevel];
        //Totalreward.text = num.ToString();
        int totalScore = Noofenemieskilled * 100;
        totalScore = totalScore + num;
        //totalScoreTxt.text = totalScore.ToString();
        AddCoins(totalScore);
        sourcecoins = Levelcompleteset.GetComponent<AudioSource>();
        yield return new WaitForSecondsRealtime(1.3f);
        LeanTween.value(gameObject, TweenCoins1, 0, num, 2f).setEase(LeanTweenType.easeInOutCubic).setIgnoreTimeScale(true);
        yield return new WaitForSecondsRealtime(1f);
        LeanTween.value(gameObject, TweenCoins2, 0, totalScore, 2f).setEase(LeanTweenType.easeInOutCubic).setIgnoreTimeScale(true);
        yield return new WaitForSecondsRealtime(2.5f);
        Nextbuttontext.transform.parent.gameObject.SetActive(true);
        StopCoroutine("CompleteDiaAnimateCoinsValue");
    }
    AudioSource sourcecoins;
    bool called = false;
    public void ShowLevelComplete()
    {
        if (!called)
        {
            called = true;
            hEADING.text = "MISSION COMPLETE";
            isLevelComplete = true;
            Pauseset.SetActive(false);
            Allcontrols.SetActive(false);
            ComPlete_InApp.SetActive(true);
            //CrossBtnSuccess.SetActive(true); CrossBtnFailed.SetActive(false);
            AnimalTargetIndicatorManager.EndLevel();
        }
	}
    public void DelayInCompletePanel()
    {
        ShopPanel.SetActive(false);
        ComPlete_InApp.SetActive(false);
        Levelcompleteset.SetActive(true);
        Debug.Log("Show levelcomplete page...");  
        StartCoroutine("CompleteDiaAnimateCoinsValue");
        Playothersoundsource(2);
        Ambiencesource.Stop();
        if (GameManager.MODE_Hard)
        {
            if (LevelSelection.levelNumber >= GameEnum.currentLevel)
            {
                GameEnum.currentLevel++;
            }
        }
        else if (GameManager.MODE_AnimalWdNameX)
        {
            print("Saving0... ");
            if (LevelSelection.levelNumber >= GameEnum.SaveCheckAnimalWDNameX)
            {
                GameEnum.SaveCheckAnimalWDNameX++;
                print("Saving1... ");
            }
        }
        else
        {
            if (GameManager.ENV_Jungle)
            {
                if (LevelSelection.levelNumber >= GameEnum.ForestLevel)
                {
                    GameEnum.ForestLevel++;
                }
            }
            else if (GameManager.ENV_Snow)
            {
                if (LevelSelection.levelNumber >= GameEnum.SnowLevel)
                {
                    GameEnum.SnowLevel++;
                }
            }
            else if (GameManager.ENV_Desert)
            {
                if (LevelSelection.levelNumber >= GameEnum.DesertLevel)
                {
                    GameEnum.DesertLevel++;
                }
            }
        }
        Nextbuttontext.text = "NEXT";
    }
    public void DelayInFailedPanel()
    {
        fail_inaap.SetActive(false);
        FailPanels.SetActive(true);
        Nextbuttontext.text = "RETRY";
        Totalkills.text = Noofenemieskilled.ToString();
        Totalreward.text = "0";
        int totalScore = Noofenemieskilled * 100;
        totalScoreTxt.text = totalScore.ToString();
        //AddCoins(totalScore);
        Playothersoundsource(3);
        //Ambiencesource.Stop();
    }
    public void ShowLevelFail()
    {
        if (!called)
        {
            called = true;
            hEADING.text = "MISSION FAILED";
            isLevelFail = true;
            Pauseset.SetActive(false);
            DisEngageallAgents();
            Allcontrols.SetActive(false);
            //ShopPanel.SetActive(true);
            if (fail_inaap != null)
			{
				fail_inaap.SetActive(true);
			}
            //CrossBtnSuccess.SetActive(false); CrossBtnFailed.SetActive(true);

            AnimalTargetIndicatorManager.EndLevel();
        }
	}

	public void Playothersoundsource(int indexvalue)
	{
		Othersoundsource.clip = Othersoundclips[indexvalue];
		Othersoundsource.Play();
	}

	public void Watchvideobuttonclicked()
	{
		AudioClipManager.Instance.Play(1);
		//AdManager.instance.ShowRewardVideoWithCallback(delegate(bool result)
		//{
		//	if (result)
		//	{
		//		Store.AddCoins(200);
		//	}
		//});
	}

	public void Resumegame()
	{
		EnableEngageallAgents();
		playercontroller.Obj.IsDead = false;
		playercontroller.Obj.hitpoints = 50f;
		Healthvalue.fillAmount = playercontroller.Obj.hitpoints / 100f;
	}

	public void StartButtonClick()
	{
		StartGame();
	}

	private void StartGame()
	{
		AudioClipManager.Instance.Play(1);
		startGame = true;
        if (GameManager.MODE_Hard)
        {
            LevelDetails._instance.levelCamera.enabled = false;
            if (LevelDetails._instance.isInfraRedLevel)
            {
                Obj.infraredButton.SetActive(true);
            }
            else
            {
                Obj.infraredButton.SetActive(false);
            }
            if (!LevelDetails._instance.isSaveVictimLevel)
            {
                targetObj.SetActive(true);
            }
            if (LevelDetails._instance.isTimeBasedLevel)
            {
                LevelDetails._instance.StartCountDown();
            }
        }
        else
        {
            targetObj.SetActive(true);
            LevelDetails._instance.timeToComplete = LevelManager._instance.TimeCount[LevelManager._instance.TestingIndex];
            LevelDetails._instance.StartCountDown();
        }
		playercontroller.Obj.mycamera.GetComponent<Camera>().enabled = true;
		Obj.levelDescriptionObj.SetActive(false);
		//Allcontrols.SetActive(true);

		AnimalTargetIndicatorManager.StartHunting();

		StartCamera startCamera = Object.FindObjectOfType(typeof(StartCamera)) as StartCamera;
		startCamera.enabled = false;
        LevelManager._instance.Camera.SetActive(false);

        AiAttack[] array = Object.FindObjectsOfType(typeof(AiAttack)) as AiAttack[];
		AiAttack[] array2 = array;
		foreach (AiAttack aiAttack in array2)
		{
			aiAttack.Invoke("SpawnAi", aiAttack.spawnDelay);
		}

        if (LevelManager._instance.TestingIndex < 2)
        {
            helpObj.SetActive(true);
            Time.timeScale = 1f;
        }

        if (GameSettingsManager.HighQualityProps)
        {
            int Rand = Random.Range(0, GameManager._instance.EffectName.Length);
            var Loader = Resources.Load(GameManager._instance.EffectName[Rand]) as GameObject;
            GameManager._instance.Effect = (GameObject)Instantiate(Loader, Camera.main.transform);
            Loader = null;
        }
    }

    public void CloseHelp()
	{
        Time.timeScale = 1f;
        AudioClipManager.Instance.Play(1);
		helpObj.SetActive(false);
	}
    public void OpenHelp()
    {
        AudioClipManager.Instance.Play(1);
        helpObj.SetActive(true);
        Time.timeScale = 0f;
    }
    public void MoveRightDown()
	{
		Debug.Log("move right down : ");
		playercontroller.Obj.moveRight = true;
		playercontroller.Obj.mb_AutoMove = true;
	}

	public void MoveRightUp()
	{
		Debug.Log("move right UP : ");
		playercontroller.Obj.moveRight = false;
		playercontroller.Obj.mb_AutoMove = false;
	}

	public void MoveLeftDown()
	{
		Debug.Log("move left down : ");
		playercontroller.Obj.moveLeft = true;
		playercontroller.Obj.mb_AutoMove = true;
	}

	public void MoveLeftUp()
	{
		Debug.Log("move left UP : ");
		playercontroller.Obj.moveLeft = false;
		playercontroller.Obj.mb_AutoMove = false;
	}

	public void DisEngageallAgents()
	{
	}

	public void EnableEngageallAgents()
	{
	}

	public void Showmoregamesfunc()
	{
		//AdManager.instance.ShowMoreGames();
	}

	public void WaveHelpOkBtnClick()
	{
		waveHelpObj.SetActive(false);
	}

}
