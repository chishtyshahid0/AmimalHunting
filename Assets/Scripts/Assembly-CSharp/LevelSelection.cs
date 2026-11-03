using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System.Collections;
using UnityEngine.SceneManagement;
public class LevelSelection : MonoBehaviour
{
    public static LevelSelection _instance;

    public static int levelNumber;

    public Image[] levels;

    public GameObject loadingPage;

    public GameObject content, LeftSideBar;

    public Sprite lockImg, lockImg2;

    public static Sprite unlockImg;

    public Sprite[] Img_Hardlevels, Img_Easylevels;

    int Value;

    private void Start()
    {
        _instance = this;
    }
    public void UpdateLevelImagesBasedOnUnlock()
    {
        if (GameManager.MODE_Easy)
        {
            if (GameManager.ENV_Jungle)
            {
                Value = GameEnum.ForestLevel;
            }
            else if (GameManager.ENV_Snow)
            {
                Value = GameEnum.SnowLevel;
            }
            else if (GameManager.ENV_Desert)
            {
                Value = GameEnum.DesertLevel;
            }
            if (LeftSideBar != null)
            {
                LeftSideBar.SetActive(true);
            }
        }
        else if (GameManager.MODE_AnimalWdNameX)
        {
            Value = GameEnum.SaveCheckAnimalWDNameX;
        }
        else//Hard Levels.....
        {
            Value = GameEnum.currentLevel;
            if (LeftSideBar != null)
            {
                LeftSideBar.SetActive(false);
                if (LeftSideBar.transform.childCount > 0) LeftSideBar.transform.GetChild(0).transform.GetComponent<Button>().interactable = false;
                if (LeftSideBar.transform.childCount > 1) LeftSideBar.transform.GetChild(1).transform.GetComponent<Button>().interactable = false;
                if (LeftSideBar.transform.childCount > 2) LeftSideBar.transform.GetChild(2).transform.GetComponent<Button>().interactable = false;
            }
        }
        //print("val : " + Value);
        //if (Value < 4)
        //{
        //}
        //else if (Value < 7)
        //{
        //    iTween.MoveTo(content.gameObject, iTween.Hash("x", -700, "time", 0.5, "islocal", true, "easetype", iTween.EaseType.linear));
        //}
        //else if (Value < 11)
        //{
        //    iTween.MoveTo(content.gameObject, iTween.Hash("x", -1300, "time", 0.5, "islocal", true, "easetype", iTween.EaseType.linear));
        //}
        //else
        //{
        //    iTween.MoveTo(content.gameObject, iTween.Hash("x", -2120, "time", 0.5, "islocal", true, "easetype", iTween.EaseType.linear));
        //}
    }

    private void OnEnable()
    {
        //Debug.Log("LevelNo__" + levelNumber);
        CheckLevelImages();
        UpdateLevelImagesBasedOnUnlock();
    }

    public void CheckLevelImages()
    {
        //Debug.Log("ModeEasy__" + GameManager.MODE_Easy);
        //Debug.Log("ModeHard__" + GameManager.MODE_Hard);
        //Debug.Log("Env__" + GameManager.ENV_Jungle);

        //Locking//UnLocking
        if (GameManager.MODE_Easy)
        {
            //Locking
            for (int i = 0; i < levels.Length; i++)
            {
                //Debug.Log("LevelNo__" + i);
                levels[i].transform.GetComponent<Button>().interactable = false;
                levels[i].transform.GetChild(0).gameObject.SetActive(false);
                levels[i].transform.Find("LockImg").transform.GetComponent<Image>().sprite = lockImg;
                levels[i].transform.Find("LockImg").gameObject.SetActive(true);
                levels[i].sprite = Img_Easylevels[i];
                //levels[i].color = Color.black;
            }
            //UnLocking
            if (GameManager.ENV_Jungle)
            {
                for (int i = 0; i < GameEnum.ForestLevel; i++)
                {
                    levels[i].transform.GetComponent<Button>().interactable = true;
                    levels[i].transform.GetChild(0).gameObject.SetActive(true);
                    //levels[i].sprite = Img_Easylevels[i];
                    levels[i].transform.Find("LockImg").gameObject.SetActive(false);
                    //levels[i].color = Color.white;
                }
            }
            else if (GameManager.ENV_Snow)
            {
                for (int i = 0; i < GameEnum.SnowLevel; i++)
                {
                    levels[i].transform.GetComponent<Button>().interactable = true;
                    levels[i].transform.GetChild(0).gameObject.SetActive(true);
                    //levels[i].sprite = Img_Easylevels[i];
                    levels[i].transform.Find("LockImg").gameObject.SetActive(false);
                    //levels[i].color = Color.white;
                }
            }
            else if (GameManager.ENV_Desert)
            {
                for (int i = 0; i < GameEnum.DesertLevel; i++)
                {
                    levels[i].transform.GetComponent<Button>().interactable = true;
                    levels[i].transform.GetChild(0).gameObject.SetActive(true);
                    //levels[i].sprite = Img_Easylevels[i];
                    levels[i].transform.Find("LockImg").gameObject.SetActive(false);
                    //levels[i].color = Color.white;
                }
            }
        }
        else if (GameManager.MODE_AnimalWdNameX)
        {
            //Locking
            for (int i = 0; i < levels.Length; i++)
            {
                levels[i].transform.GetComponent<Button>().interactable = false;
                levels[i].transform.GetChild(0).gameObject.SetActive(false);
                levels[i].sprite = unlockImg;
                levels[i].transform.Find("LockImg").transform.GetComponent<Image>().sprite = lockImg;
                levels[i].transform.Find("LockImg").gameObject.SetActive(true);
                //levels[i].color = Color.black;
            }
            //Unlocking
            for (int i = 0; i < GameEnum.SaveCheckAnimalWDNameX; i++)
            {
                levels[i].transform.GetComponent<Button>().interactable = true;
                levels[i].transform.GetChild(0).gameObject.SetActive(true);
                //levels[i].sprite = unlockImg;
                levels[i].transform.Find("LockImg").gameObject.SetActive(false);
                //levels[i].color = Color.white;
            }
            print("Unlocking... ");
        }
        else//Hard Levels.....
        {
            //Locking
            for (int i = 0; i < levels.Length; i++)
            {
                //Debug.Log("LevelNo__" + i);
                levels[i].transform.GetComponent<Button>().interactable = false;
                levels[i].transform.GetChild(0).gameObject.SetActive(false);
                levels[i].sprite = Img_Hardlevels[i];
                levels[i].transform.Find("LockImg").transform.GetComponent<Image>().sprite = lockImg2;
                levels[i].transform.Find("LockImg").gameObject.SetActive(true);
                //levels[i].color = Color.black;
            }
            //Unlocking
            for (int i = 0; i < GameEnum.currentLevel; i++)
            {
                levels[i].transform.GetComponent<Button>().interactable = true;
                levels[i].transform.GetChild(0).gameObject.SetActive(true);
                //levels[i].sprite = Img_Hardlevels[i];
                levels[i].transform.Find("LockImg").gameObject.SetActive(false);
                //levels[i].color = Color.white;
            }
        }
    }
    //int Index;
    //public void SelectLevelHuntBtn()
    //{
    //    AudioClipManager.Instance.Play(1);
    //    levelNumber = Index;
    //    LoadLevel();
    //    loadingPage.SetActive(true);
    //}
    public void SelectLevel(int currentLevel)
    {
        AudioClipManager.Instance.Play(1);
        levelNumber = currentLevel;
        //Debug.Log("levelNumber::" + levelNumber);
        loadingPage.SetActive(true);
        LoadLevel();
//        Adscaller.instance.on_levelselection();
    }

    private void LoadLevel()
    {
        if (GameManager.MODE_Easy)
        {
            if (GameManager.ENV_Jungle)
            {
                StartCoroutine(SceneLoading("Ingame_Forest"));
            }
            else if (GameManager.ENV_Snow)
            {
                StartCoroutine(SceneLoading("Ingame_Snow"));
            }
            else if (GameManager.ENV_Desert)
            {
                StartCoroutine(SceneLoading("Ingame_Desert"));
            }
        }
        else if (GameManager.MODE_AnimalWdNameX)
        {
            Value = Random.Range(0, 20);
            if (Value < 6)
            {
                StartCoroutine(SceneLoading("Ingame_Forest"));
            }
            else if (Value < 13)
            {
                StartCoroutine(SceneLoading("Ingame_Snow"));
            }
            else
            {
                StartCoroutine(SceneLoading("Ingame_Desert"));
            }
        }
        else//Hard Levels.....
        {
            string text = EventSystem.current.currentSelectedGameObject.name;
            Debug.Log(" name :" + text);
            GameObject currentSelectedGameObject = EventSystem.current.currentSelectedGameObject;
            if (currentSelectedGameObject.GetComponent<SelectLevelType>().theme == SelectLevelType.LevelTheme.forest)
            {
                StartCoroutine(SceneLoading("Ingame_Forest"));
            }
            else if (currentSelectedGameObject.GetComponent<SelectLevelType>().theme == SelectLevelType.LevelTheme.snow)
            {
                StartCoroutine(SceneLoading("Ingame_Snow"));
            }
            else if (currentSelectedGameObject.GetComponent<SelectLevelType>().theme == SelectLevelType.LevelTheme.desert)
            {
                StartCoroutine(SceneLoading("Ingame_Desert"));
            }
        }
    }
    IEnumerator SceneLoading(string i)
    {
        yield return new WaitForSeconds(10f);
        Scene s = SceneManager.GetSceneByName(i);
        AsyncOperation AsyncScene = SceneManager.LoadSceneAsync(i);
        while (!AsyncScene.isDone)
        {
            yield return null;
        }
    }
}
