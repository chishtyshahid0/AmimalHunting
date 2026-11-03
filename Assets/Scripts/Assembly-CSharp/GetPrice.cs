using UnityEngine;
using UnityEngine.UI;

public class GetPrice : MonoBehaviour
{
	public bool IsNonConsumable;

	public int Index;

	private void OnEnable()
	{
		if (IsNonConsumable)
		{
			if (PlayerPrefs.HasKey("nonConsumableProducts_" + Index))
			{
				base.gameObject.GetComponent<Text>().text = PlayerPrefs.GetString("nonConsumableProducts_" + Index, "BUY");
			}
		}
		else if (PlayerPrefs.HasKey("consumableProducts_" + Index))
		{
			base.gameObject.GetComponent<Text>().text = PlayerPrefs.GetString("consumableProducts_" + Index, "BUY");
		}
	}
}
