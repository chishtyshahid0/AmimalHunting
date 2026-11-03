using UnityEngine;
using UnityEngine.SceneManagement;

public class LevelFailSample : MonoBehaviour
{
	public static LevelFailSample instance;

	public GameObject PopUp;

	private void Awake()
	{
		instance = this;
		base.gameObject.SetActive(false);
	}

	public void Open()
	{
		base.gameObject.SetActive(true);
		PopUp.transform.localPosition = Vector3.zero;
		iTween.MoveFrom(PopUp, iTween.Hash("y", 1000, "time", 0.4f, "islocal", true, "easetype", iTween.EaseType.spring));
		//AdManager.instance.RunActions(AdManager.PageType.LF, InGameSample.CurrentLvl);
	}

	public void Close()
	{
		SceneManager.LoadScene("MenuSample");
	}

	public void RetryBtnClick()
	{
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}
}
