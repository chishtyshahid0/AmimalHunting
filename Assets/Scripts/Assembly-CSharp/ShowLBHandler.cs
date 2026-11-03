using UnityEngine;
using UnityEngine.UI;

public class ShowLBHandler : MonoBehaviour
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
		Debug.Log("--- Show Leaderboards click");
		//AdManager.instance.ShowLeaderBoards();
	}
}
