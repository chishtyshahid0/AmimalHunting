using UnityEngine;

public class ScaleMe : MonoBehaviour
{
	public GameObject[] buttons;

	public float time = 0.5f;

	public float delay = 1f;

	public float buttonQueDelay = 0.2f;

	public iTween.EaseType easetype = iTween.EaseType.easeOutBack;

	private void OnEnable()
	{
		for (int i = 0; i < buttons.Length; i++)
		{
			iTween.ScaleFrom(buttons[i].gameObject, iTween.Hash("x", 0, "y", 0, "time", time, "islocal", true, "delay", ((float)i + delay) * buttonQueDelay, "easetype", easetype));
		}
	}

	private void OnDisable()
	{
		for (int i = 0; i < buttons.Length; i++)
		{
			buttons[i].transform.localScale = new Vector3(1f, 1f, 1f);
		}
	}


}
