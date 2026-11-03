using UnityEngine;
using UnityEngine.UI;

public class LevelFail : MonoBehaviour
{
	public static LevelFail _instance;

	public Text totalCoinsText;

	private void Awake()
	{
		_instance = this;
	}

	private void Start()
	{
	}

	public void UpdateCoinText()
	{
		totalCoinsText.text = PlayerPrefs.GetInt(GameEnum.totalCoins).ToString();
	}
}
