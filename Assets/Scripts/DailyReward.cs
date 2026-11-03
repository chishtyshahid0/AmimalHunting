using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using UnityEngine;
using UnityEngine.UI;

public class DailyReward : MonoBehaviour
{
    public static DailyReward Instance;
    private static System.DateTime startDate;
    private static System.DateTime today;

    [Header("Sirf ek button: CLAIM")]
    public Button ClaimBtn;

    [Header("7 day cards (Day01 ... Day07) - button hona zaroori nahi")]
    public GameObject[] DayCards;

    [Header("Har card ke andar selector child ka naam")]
    public string SelectorChildName = "Selector";

    public GameObject RewardPanel, AvailableCratePanel;
    public Animator AnimAtor;

    private int TodayIndex = 0;
    private const int TotalDays = 7;

    // Screenshot ke mutabiq coins: Day01..Day07
    private readonly int[] RewardCoins = { 120, 240, 360, 480, 600, 700, 900 };

    public Text CrateRewardData;
    public string[] CrateRewardDataDetail;
    public Image CrateRewardImg;
    public Sprite[] CrateRewardImages;

    void Start()
    {
        Instance = this;

        // Ek hi button: Claim dabane par reward milega
        ClaimBtn.onClick.RemoveListener(ClaimTodaysReward);
        ClaimBtn.onClick.AddListener(ClaimTodaysReward);

        SetStartingDate();

        // Day numbers (1 se 7)
        for (int i = 0; i < TotalDays && i < DayCards.Length; i++)
        {
            Transform t = DayCards[i].transform.Find("Day/DayText");
            if (t != null)
            {
                Text txt = t.GetComponent<Text>();
                if (txt != null) txt.text = (i + 1).ToString();
            }
        }

        // Day 07 claim ho chuka ho to panel band
        if (PlayerPrefs.GetInt("RewardCollectDay" + (TotalDays - 1)) == 1)
        {
            HideSelector();
            RewardPanel.SetActive(false);
        }
        else
        {
            CheckifAvailableReward();
        }
    }

    void AfterClaimedRewrd()
    {
        RewardPanel.transform.GetChild(0).gameObject.SetActive(false);
        AvailableCratePanel.SetActive(true);
    }

    public void ClaimTodaysReward()
    {
        // Double claim se bachao
        if (!ClaimBtn.interactable || PlayerPrefs.GetInt("RewardCollectDay" + TodayIndex) == 1)
            return;

        PlayerPrefs.SetInt("RewardCollectDay" + TodayIndex, 1);
        Rewardsperday(TodayIndex);

        // Agle din ka timer claim ke waqt se shuru
        startDate = System.DateTime.Now;
        PlayerPrefs.SetString("DayInitialized", startDate.ToString("o", CultureInfo.InvariantCulture));
        PlayerPrefs.Save();

        ShowClaimedState(TodayIndex);
        ClaimBtn.interactable = false;
        RefreshSelector(); // claim hone wale card ka selector on
        if (AnimAtor != null) AnimAtor.enabled = true; // Reward Panel
        Invoke("AfterClaimedRewrd", 1f);
    }

    public void CheckifAvailableReward()
    {
        for (int Index = 0; Index < TotalDays && Index < DayCards.Length; Index++)
        {
            if (PlayerPrefs.GetInt("RewardCollectDay" + Index) != 1)
            {
                // Day 01 foran available, baqi din 24 ghante baad
                if (Index == 0 || GetDaysPassed() > 0)
                {
                    TodayIndex = Index;
                    RewardPanel.SetActive(true);
                    ClaimBtn.interactable = true;
                    ShowAvailableState(Index);
                }
                else
                {
                    RewardPanel.SetActive(false);
                }
                break;
            }
            else
            {
                ShowClaimedState(Index);
            }
        }

        RefreshSelector();
    }

    // ---------- Card states (sab null-safe) ----------
    void ShowAvailableState(int i)
    {
        GameObject card = DayCards[i];
        SetAnimator(card, true);
        SetChild(card, "RewardAvailable", true);
        SetChild(card, "Claim", true);
        SetChild(card, "RewardLocked", false);
        SetChild(card, "Lock", false);
    }

    void ShowClaimedState(int i)
    {
        GameObject card = DayCards[i];
        SetAnimator(card, false);
        SetChild(card, "RewardAvailable", false);
        SetChild(card, "Claim", false);
        SetChild(card, "RewardClaimed", true);
        SetChild(card, "Tick", true);
        SetChild(card, "RewardLocked", false);
        SetChild(card, "Lock", false);
    }

    void SetChild(GameObject card, string childName, bool active)
    {
        Transform t = card.transform.Find(childName);
        if (t != null) t.gameObject.SetActive(active);
    }

    void SetAnimator(GameObject card, bool enable)
    {
        Animator a = card.GetComponent<Animator>();
        if (a != null) a.enabled = enable;
    }

    // ---------- Selector ----------
    // Jo card claim ho chuka hai (sab se aakhri claimed) usi ka selector on
    void RefreshSelector()
    {
        int lastClaimed = -1;
        for (int i = 0; i < TotalDays && i < DayCards.Length; i++)
        {
            if (PlayerPrefs.GetInt("RewardCollectDay" + i) == 1)
                lastClaimed = i;
        }

        if (lastClaimed >= 0)
            ShowSelector(lastClaimed);
        else
            HideSelector();
    }

    // Sirf selected card ka selector on, baqi sab off
    void ShowSelector(int index)
    {
        for (int i = 0; i < DayCards.Length; i++)
        {
            SetChild(DayCards[i], SelectorChildName, i == index);
        }
    }

    void HideSelector()
    {
        for (int i = 0; i < DayCards.Length; i++)
        {
            SetChild(DayCards[i], SelectorChildName, false);
        }
    }

    // ---------- Date ----------
    void SetStartingDate()
    {
        if (PlayerPrefs.HasKey("DayInitialized"))
        {
            startDate = System.DateTime.Parse(PlayerPrefs.GetString("DayInitialized"),
                CultureInfo.InvariantCulture, DateTimeStyles.RoundtripKind);
        }
        else
        {
            startDate = System.DateTime.Now;
            PlayerPrefs.SetString("DayInitialized", startDate.ToString("o", CultureInfo.InvariantCulture));
            RewardPanel.SetActive(true);
        }
    }

    public static int GetDaysPassed()
    {
        today = System.DateTime.Now;
        System.TimeSpan elapsed = today.Subtract(startDate);
        return (int)elapsed.TotalDays;
    }

    // ---------- Coins ----------
    public void Rewardsperday(int Day)
    {
        int E1 = PlayerPrefs.GetInt(GameEnum.totalCoins, 0);

        if (Day >= 0 && Day < RewardCoins.Length)
        {
            PlayerPrefs.SetInt(GameEnum.totalCoins, E1 + RewardCoins[Day]);
        }

        int E2 = PlayerPrefs.GetInt(GameEnum.totalCoins, 0);
        CalculateMoney.TVal = E2 - E1;
    }
}
