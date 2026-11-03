using UnityEngine;
using UnityEngine.UI;

public class Menu : MonoBehaviour
{
	public static Menu _instance;

	//public Text QualityPrint;

	//public GameObject title;

	private void Awake()
	{
		_instance = this;
	}

	private void OnEnable()
	{
		if ((bool)PageHandler._instance)
		{
			PageHandler._instance.pageType = PageHandler.pageTypeEnum.menu;
		}
	}
    

    //public void QualitySet(int value)
    //{
    //    PlayerPrefs.SetInt("Quality", value);
    //    QualityPrint.text = value.ToString();
    //}
}
