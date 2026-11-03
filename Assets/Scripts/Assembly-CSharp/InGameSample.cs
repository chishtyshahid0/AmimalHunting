using UnityEngine;
using UnityEngine.UI;

public class InGameSample : MonoBehaviour
{
	public Text LvlNo;

	public static int CurrentLvl;

	public GameObject LCBtn;

	public GameObject LFBtn;

	private void Awake()
	{
		LCBtn.GetComponent<Button>().interactable = false;
		LFBtn.GetComponent<Button>().interactable = false;
	}

	private void Start()
	{
		LvlNo.text = "Level" + CurrentLvl;
		//AdManager.instance.RunActions(AdManager.PageType.InGame, CurrentLvl);
		Invoke("EnableBtns", 3f);
	}

	private void EnableBtns()
	{
		LCBtn.GetComponent<Button>().interactable = true;
		LFBtn.GetComponent<Button>().interactable = true;
	}

	public void LCClick()
	{
		LevelCompleteSample.instance.Open();
	}

	public void LFClick()
	{
		PreLFPage.instance.Open();
	}
}
