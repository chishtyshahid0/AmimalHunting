using UnityEngine;
using UnityEngine.UI;

public class Canvashandler : MonoBehaviour
{
	private void OnEnable()
	{
		GetComponent<Canvas>().enabled = true;
		GetComponent<GraphicRaycaster>().enabled = true;
		GetComponent<CanvasScaler>().enabled = true;
	}

	private void OnDisable()
	{
		GetComponent<Canvas>().enabled = false;
		GetComponent<GraphicRaycaster>().enabled = false;
		GetComponent<CanvasScaler>().enabled = false;
	}
}
