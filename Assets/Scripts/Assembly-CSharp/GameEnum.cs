using UnityEngine;

public class GameEnum : MonoBehaviour
{
	public static string selectedGun = "selectedGun";

	public static string levelUnlocked = "levelUnlocked";

	public static string totalCoins = "totalCoins";

	public static string gunPurchased = "gunPurchased";

	public static string latestGunUnlocked = "latestGunUnlocked";

	public static string isShareDone = "isShareDone";

    public static string AnimalName;

    public static int SaveCheckAnimalWDNameX
    {
        get
        {
            return PlayerPrefs.GetInt(AnimalName, 1);
        }
        set
        {
            PlayerPrefs.SetInt(AnimalName, value);
        }
    }

    public static int currentGun
	{
		get
		{
			return PlayerPrefs.GetInt(selectedGun, 1);
		}
		set
		{
			PlayerPrefs.SetInt(selectedGun, value);
		}
	}

	public static string strUnlockedSnipers
	{
		get
		{
			return PlayerPrefs.GetString("strUnlockedSnipers", "1000000000");
		}
		set
		{
			PlayerPrefs.SetString("strUnlockedSnipers", value);
		}
	}

	public static int currentLevel
	{
		get
		{
			return PlayerPrefs.GetInt("currentlevel", 1);
		}
		set
		{
			PlayerPrefs.SetInt("currentlevel", value);
		}
	}
    public static int ForestLevel
    {
        get
        {
            return PlayerPrefs.GetInt("ForestLevel", 1);
        }
        set
        {
            PlayerPrefs.SetInt("ForestLevel", value);
        }
    }
    public static int SnowLevel
    {
        get
        {
            return PlayerPrefs.GetInt("SnowLevel", 1);
        }
        set
        {
            PlayerPrefs.SetInt("SnowLevel", value);
        }
    }
    public static int DesertLevel
    {
        get
        {
            return PlayerPrefs.GetInt("DesertLevel", 1);
        }
        set
        {
            PlayerPrefs.SetInt("DesertLevel", value);
        }
    }
}
