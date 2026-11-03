using UnityEngine;
using UnityEngine.UI;

public class ModeSelection : MonoBehaviour
{
    //public static ModeSelection_GZ1 inst;
    //public LevelSelection L_S;
    public AudioClip buttonSound;
    //public int OpenIndex;
    public GameObject Mode_Easy, Mode_Hard ,MainModesPanel;
    public GameObject Panel_FarmAnimal, Panel_ForestAnimal, Panel_DeadliestCreature, Panel_InnocentAnimal;
    //private string Nam;
    //public GameObject ModeUnlockedNow, ModeUnlockedNow2;
    public Sprite Img_Bear, Img_Cheetah, Img_Lion, Img_Rhino, Img_Buffalo, Img_Camel, Img_Deer, Img_Elephant, Img_Giraffe, Img_Sheep, Img_Stag, Img_Wolf;

    public void Awake()
    {
        //inst = this;
    }
    private void OnEnable()
    {
        MainModesPanel.SetActive(true);
        Panel_FarmAnimal.SetActive(false);
        Panel_ForestAnimal.SetActive(false);
        Panel_DeadliestCreature.SetActive(false);
        Panel_InnocentAnimal.SetActive(false);
    }
    public void OpenThis_Panel(GameObject obj)
    {
        AudioClipManager.Instance.Play(0);
        MainModesPanel.SetActive(false);
        Panel_FarmAnimal.SetActive(false);
        Panel_ForestAnimal.SetActive(false);
        Panel_DeadliestCreature.SetActive(false);
        Panel_InnocentAnimal.SetActive(false);
        obj.SetActive(true);
    }
    void Start()
    {
        Time.timeScale = 1f;
        if (GameEnum.ForestLevel >= 4)
        {
            //Unlocking Mode_Hard Here
            Mode_Hard.GetComponent<Button>().interactable = true;
            Mode_Hard.transform.Find("BUY").gameObject.SetActive(false);
        }
        for (int x = 1; x < 13; x++)
        {
            int n = x; n--;
            //PlayerPrefs.SetInt("MODE_AnimalWdName" + x, PlayerPrefs.GetInt("ArmoryLVL" + x, LevelManegs.TotalLevels * n));
        }
    }
    public void SelectMode(int Mode)
    {
        GameManager.ENV_Jungle = false; GameManager.ENV_Snow = false; GameManager.ENV_Desert = false;
        GameManager.MODE_Easy = false; GameManager.MODE_Hard = false; GameManager.MODE_AnimalWdNameX = false;
        MainModesPanel.SetActive(false);
        if (Mode == 1)
        {//Easy
            GameManager.MODE_Easy = true;
            PageHandler._instance.Open_UpgradeGuns();
        }
        else if(Mode == 2)
        {//Hard
            GameManager.MODE_Hard = true;
            PageHandler._instance.Open_UpgradeGuns();
        }
        else if (Mode == 3)
        {//Challenge
            
        }
        else if (Mode == 4)
        {//Farm Animals
            Panel_FarmAnimal.SetActive(true);
        }
        else if (Mode == 5)
        {//Forest Animals
            Panel_ForestAnimal.SetActive(true);
        }
        else if (Mode == 6)
        {//Deadliest Creatures
            Panel_DeadliestCreature.SetActive(true);
        }
        else if (Mode == 7)
        {//Innocent Animals
            Panel_InnocentAnimal.SetActive(true);
        }
        else if (Mode == 8)
        {//Limited Time
            
        }
        else if (Mode == 9)
        {//Most Cute Cats
            
        }
        else if (Mode == 10)
        {//Guns Mode

        }
        else if (Mode == 11)
        {//

        }
    }
    public void LockedMessage()
    {
        AudioClipManager.Instance.Play(0);
        PageHandler._instance.LockedPanel.SetActive(true);
        PageHandler._instance.LockedTxt.text = "Requirement: Complete 5 levels in Easy Mode to Unlock this Mode ...!";
    }
    public void FarmAnimalSlect(int No)
    {
        if (No == 0)
        {
            LevelManage_AnimalWdName("Buffalo");
            LevelSelection.unlockImg = Img_Buffalo;
        }
        else if (No == 1)
        {
            LevelManage_AnimalWdName("Camel");
            LevelSelection.unlockImg = Img_Camel;
        }
        else if (No == 2)
        {
            LevelManage_AnimalWdName("Sheep");
            LevelSelection.unlockImg = Img_Sheep;
        }
    }
    public void ForestAnimalSlect(int No)
    {
        if (No == 0)
        {
            LevelManage_AnimalWdName("Deer");
            LevelSelection.unlockImg = Img_Deer;
        }
        else if (No == 1)
        {
            LevelManage_AnimalWdName("Bear");
            LevelSelection.unlockImg = Img_Bear;
        }
        else if (No == 2)
        {
            LevelManage_AnimalWdName("Elephant");
            LevelSelection.unlockImg = Img_Elephant;
        }
        else if (No == 3)
        {
            LevelManage_AnimalWdName("Cheetah");
            LevelSelection.unlockImg = Img_Cheetah;
        }
        else if (No == 4)
        {
            LevelManage_AnimalWdName("Giraffe");
            LevelSelection.unlockImg = Img_Giraffe;
        }
        else if (No == 5)
        {
            LevelManage_AnimalWdName("Lion");
            LevelSelection.unlockImg = Img_Lion;
        }
        else if (No == 6)
        {
            LevelManage_AnimalWdName("Stag");
            LevelSelection.unlockImg = Img_Stag;
        }
        else if (No == 7)
        {
            LevelManage_AnimalWdName("Wolf");
            LevelSelection.unlockImg = Img_Wolf;
        }
        else if (No == 8)
        {
            LevelManage_AnimalWdName("Rhino");
            LevelSelection.unlockImg = Img_Rhino;
        }
    }
    void LevelManage_AnimalWdName(string Nam)
    {
        GameManager.MODE_AnimalWdNameX = true;
        GameEnum.AnimalName = Nam;
        PageHandler._instance.Open_UpgradeGuns();
    }
}

