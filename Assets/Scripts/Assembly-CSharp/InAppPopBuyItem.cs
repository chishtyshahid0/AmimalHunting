using UnityEngine;
using UnityEngine.UI;

public class InAppPopBuyItem : MonoBehaviour
{
	public enum InAppType
	{
		None = 0,
		UnlockAllUpgradsType = 1,
		UnlockAllUpgradesDiscountType = 2,
		UnlockAllLevelsType = 3,
		UnlockAllLevelsDiscountType = 4,
	}

	public enum InAppCategory
	{
		Consumable = 0,
		NonConsumable = 1,
	}

	public Text PriceTxt;
	public bool ShowPrice;
	public InAppType TypeOfProduct;
	public InAppCategory inAppCategory;
}
