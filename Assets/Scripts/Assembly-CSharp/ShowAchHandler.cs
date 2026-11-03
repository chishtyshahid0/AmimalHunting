using UnityEngine;
using UnityEngine.UI;

public class ShowAchHandler : MonoBehaviour
{
	private void Start()
	{
		base.gameObject.GetComponent<Button>().onClick.AddListener(delegate
		{
			BuyClicked();
		});
	}

	public void BuyClicked()
	{
		Debug.Log("--- Show Achievements click");
		//AdManager.instance.ShowAchievements();
		
	}
}
