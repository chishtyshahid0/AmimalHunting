using UnityEngine;
using UnityEngine.UI;

public class UpgradeGuns : MonoBehaviour
{
    public static UpgradeGuns _instance;

    public GameObject[] myGuns;

    public int gunIndex;

    public GameObject nextBtn;

    public GameObject previousBtn;

    public GameObject selectBtn;

    public GameObject buyBtn;

    public Text priceText;

    public int gunCost;

    public int[] gunCostArray;

    public int totalCoins;

    private string gunPurchasedStr;

    public GameObject unlockAllGunsBtn;

    public GameObject loading;

    public Text magazineTxt;

    public Text accuracyTxt;

    public Text fireRateTxt;

    public Text zoomTxt, LvlTxt;

    public Text gunNameTxt;

    public string[] magazine = new string[0];

    public string[] accuracy = new string[0];

    public string[] firerate = new string[10] { "410 HP", "460 HP", "510 HP", "310 HP", "450 HP", "510 HP", "480 HP", "540 HP", "680 HP", "476 HP" };

    public string[] zoom = new string[0]; public string[] Lvl = new string[0];

    private string[] gunName = new string[30]
    {
        "Garett R20 ", "Zmalite", "Laseroff  XT", "Sragunova", "Ror rifle", "Maskin", "GT-40", "T15 rifle", "Yastav K07", "RZ 500 Sniper rifle",
        "Solvo X80", "Kebel", "Samborginee", "Daltra", "jazda", "Rondai", "Huget", "Cherystler", "Amber", "Taxi Cab",
        "Quand Yover", "Cherystler", "Blue Star", "Quand Yover", "Denaulto", "Tinky", "Flipper", "Rordai", "Police Car", "Luxury lane"
    };

    public static bool isShowingDirectUpgradeInApp;

    public GameObject upgradeGunCam, Content;

   // public Sprite Selected, NotSelected;
    public Sprite[] SelectedSprites = new Sprite[10];
    public Sprite[] NotSelectedSprites = new Sprite[10];

    private int[] zoomOutIndexArray = new int[9] { 6, 7, 9, 10, 14, 19, 23, 27, 30 };

    private float time = 0.8f;

    private int tempLatestGunInt;

    public int[] FireRate, Zoom, Mag, Accuracy, UpgradeLvl;
    public Image Img_FireRate, Img_Zoom, Img_Mag, Img_Accuracy, Img_UpgradeLvl;

    private void Start()
    {
        if (PlayerPrefs.GetInt("UnlockGunsPack", 0) == 1)
            UnlockAllGunsBoughtSuccesfully();
        _instance = this;
        //Debug.Log("upgrade Start::");
        iTween.MoveBy(upgradeGunCam.gameObject, iTween.Hash("y", 0.1, "time", 1, "looptype", iTween.LoopType.pingPong, "easetype", iTween.EaseType.linear));

        for (int k = 0; k < myGuns.Length; k++)
        {
            Content.transform.GetChild(k).transform.GetChild(0).transform.gameObject.GetComponent<Text>().text = gunName[k];
        }
    }

    private void OnEnable()
    {
        UpdateCoinText();
        gunPurchasedStr = PlayerPrefs.GetString(GameEnum.gunPurchased);
        loading.SetActive(false);
        CheckAllInAppButtons();
        ChangeDetails();
        if (!PlayerPrefs.HasKey(GameEnum.latestGunUnlocked))
        {
            PlayerPrefs.SetInt(GameEnum.latestGunUnlocked, 0);
        }
        for (int i = 0; i < myGuns.Length; i++)
        {
            myGuns[i].SetActive(false);
            gunIndex = 0;
        }
        if (PlayerPrefs.GetInt(GameEnum.latestGunUnlocked) == 0)
        {
            myGuns[0].SetActive(true);
        }
        else
        {
            gunIndex = PlayerPrefs.GetInt(GameEnum.latestGunUnlocked);
            myGuns[gunIndex].SetActive(true);
        }
        //Debug.Log("last bike unlocked :" + PlayerPrefs.GetInt(GameEnum.latestGunUnlocked));
    }

    public void CheckAllInAppButtons()
    {
        if (PlayerPrefs.GetString(GameEnum.gunPurchased) == "1111111111")
        {
            unlockAllGunsBtn.SetActive(false);
            selectBtn.GetComponent<Button>().interactable = true; selectBtn.SetActive(true);
            buyBtn.GetComponent<Button>().interactable = false; buyBtn.SetActive(false); unlockAllGunsBtn.SetActive(false);
        }
    }
    public void GunButtonClick(int Index)
    {
        gunIndex = Index;
        AudioClipManager.Instance.Play(1);
        previousBtn.SetActive(true);
        nextBtn.SetActive(true);
        if (gunIndex <= 0)
        {
            previousBtn.SetActive(false);
        }
        else if (gunIndex >= myGuns.Length - 1)
        {
            nextBtn.SetActive(false);
        }
        for (int i = 0; i < myGuns.Length; i++)
        {
            myGuns[i].SetActive(false);
        }
        myGuns[gunIndex].SetActive(true);
        CheckBuyBtn();
        ChangeDetails();
    }
    public void NextClick()
    {
        AudioClipManager.Instance.Play(1);
        if (gunIndex < 9)
        {
            gunIndex++;
            previousBtn.SetActive(true);
            for (int i = 0; i < myGuns.Length; i++)
            {
                myGuns[gunIndex].SetActive(true);
            }
            myGuns[gunIndex - 1].SetActive(false);
            if (gunIndex >= myGuns.Length - 1)
            {
                nextBtn.SetActive(false);
            }
            CheckBuyBtn();
            ChangeDetails();
        }
    }

    public void PreviousClick()
    {
        AudioClipManager.Instance.Play(1);
        if (gunIndex > 0)
        {
            gunIndex--;
            nextBtn.SetActive(true);
            Debug.Log("CarIndex" + gunIndex);
            for (int i = 0; i < myGuns.Length; i++)
            {
                myGuns[gunIndex].SetActive(true);
            }
            myGuns[gunIndex + 1].SetActive(false);
            if (gunIndex <= 0)
            {
                previousBtn.SetActive(false);
            }
            CheckBuyBtn();
            if (PlayerPrefs.GetString(GameEnum.gunPurchased) != "1111111111")
            {
            }
            ChangeDetails();
        }
    }

    private void NextBtnInteractableTrue()
    {
        nextBtn.GetComponent<Button>().interactable = true;
    }

    private void PreviousBtnInteractableTrue()
    {
        previousBtn.GetComponent<Button>().interactable = true;
    }

    public void CheckBuyBtn()
    {
        gunCost = gunCostArray[gunIndex];
        priceText.text = gunCost.ToString();
        gunUnlockCheck(gunIndex);
    }

    public void BuyClick(int _index)
    {
        char[] array = gunPurchasedStr.ToCharArray();
        if (totalCoins >= gunCost)
        {
            array[_index] = '1';
            tempLatestGunInt = _index;
            PlayerPrefs.SetInt(GameEnum.latestGunUnlocked, tempLatestGunInt);
            Debug.Log("latest unlocked vehicle index::" + PlayerPrefs.GetInt(GameEnum.latestGunUnlocked));
            string value = new string(array);
            PlayerPrefs.SetString(GameEnum.gunPurchased, value);
            gunPurchasedStr = PlayerPrefs.GetString(GameEnum.gunPurchased);
            Debug.Log("you can buy");
            totalCoins -= gunCost;
            Debug.Log("totalcoins after purchase::" + totalCoins);
            PlayerPrefs.SetInt(GameEnum.totalCoins, totalCoins);
            UpdateCoinText();
            gunUnlockCheck(_index);
        }
        else
        {
            PageHandler._instance.LockedPanel.SetActive(true);
            PageHandler._instance.LockedTxt.text = "Not Enough Money ...!";
        }
        Debug.Log("vehicleString::" + PlayerPrefs.GetString(GameEnum.gunPurchased));
    }

    public bool gunUnlockCheck(int _index)
    {
        gunPurchasedStr = PlayerPrefs.GetString(GameEnum.gunPurchased);
        if (gunPurchasedStr.Substring(_index, 1) == "1")
        {
            Debug.Log("index in car unlockcheck is ::" + _index);
            selectBtn.GetComponent<Button>().interactable = true; selectBtn.SetActive(true);
            buyBtn.GetComponent<Button>().interactable = false; buyBtn.SetActive(false); unlockAllGunsBtn.SetActive(false);
            Debug.Log("index in car unlockcheck is ::" + _index);
            return true;
        }
        Debug.Log("index in car unlockcheck else is ::" + _index);
        selectBtn.GetComponent<Button>().interactable = false; selectBtn.SetActive(false);
        buyBtn.GetComponent<Button>().interactable = true; buyBtn.SetActive(true); unlockAllGunsBtn.SetActive(true);
        return false;
    }

    public void BuyButtonClick()
    {
        BuyClick(gunIndex);
    }

    public void UpdateCoinText()
    {
        totalCoins = PlayerPrefs.GetInt(GameEnum.totalCoins);
        //Debug.Log("totalcoins::" + totalCoins);
    }

    public void ShareClick()
    {
        Debug.Log("Share");
        PlayerPrefs.SetString(GameEnum.isShareDone, "true");
    }

    public void SelectClick()
    {
        PageHandler._instance.Open_LevelSelection();
    }

    private void ChangeDetails()
    {
        for (int k = 0; k < myGuns.Length; k++)
        {
            // YAHAN CHANGE KIYA HAI (NotSelectedSprites array use kar rahe hain)
            if (k < NotSelectedSprites.Length && NotSelectedSprites[k] != null)
            {
                Content.transform.GetChild(k).transform.gameObject.GetComponent<Image>().sprite = NotSelectedSprites[k];
            }
            else
            {
              //  Content.transform.GetChild(k).transform.gameObject.GetComponent<Image>().sprite = NotSelected; // Fallback
            }
        }

        // YAHAN CHANGE KIYA HAI (SelectedSprites array use kar rahe hain)
        if (gunIndex < SelectedSprites.Length && SelectedSprites[gunIndex] != null)
        {
            Content.transform.GetChild(gunIndex).transform.gameObject.GetComponent<Image>().sprite = SelectedSprites[gunIndex];
        }
        else
        {
          //  Content.transform.GetChild(gunIndex).transform.gameObject.GetComponent<Image>().sprite = Selected; // Fallback
        }

        //int Value = 142 * gunIndex;
        //iTween.MoveTo(Content.gameObject, iTween.Hash("Y", -Value, "time", 0.5, "islocal", true, "easetype", iTween.EaseType.linear)); 

        gunNameTxt.text = gunName[gunIndex];
        accuracyTxt.text = accuracy[gunIndex];
        magazineTxt.text = magazine[gunIndex];
        zoomTxt.text = zoom[gunIndex];
        fireRateTxt.text = magazine[gunIndex];
        LvlTxt.text = Lvl[gunIndex];

        float val = 100f;
        Img_FireRate.fillAmount = FireRate[gunIndex] / 45f;
        Img_Zoom.fillAmount = Zoom[gunIndex] / val;
        Img_Mag.fillAmount = Mag[gunIndex] / val;
        Img_Accuracy.fillAmount = Accuracy[gunIndex] / val;
        Img_UpgradeLvl.fillAmount = UpgradeLvl[gunIndex] / val;
    }

    public void UnlockAllGunsBoughtSuccesfully()
    {
        for (int index = 0; index < 10; index++)
        {
            char[] array = gunPurchasedStr.ToCharArray();
            array[index] = '1';

            tempLatestGunInt = index;
            PlayerPrefs.SetInt(GameEnum.latestGunUnlocked, tempLatestGunInt);

            string value = new string(array);
            PlayerPrefs.SetString("gunPurchased", value);
            gunPurchasedStr = PlayerPrefs.GetString("gunPurchased");
        }
    }
}
