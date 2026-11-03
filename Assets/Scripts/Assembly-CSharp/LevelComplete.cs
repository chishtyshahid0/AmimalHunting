using UnityEngine;
using UnityEngine.UI;

public class LevelComplete : MonoBehaviour
{
	public static LevelComplete _instance;

	public Text totalCoinsText;

	private void Awake()
	{
		_instance = this;
	}

	private void Update()
	{
	}

	public void UpdateCoinText()
	{
		totalCoinsText.text = PlayerPrefs.GetInt(GameEnum.totalCoins).ToString();
	}
}
