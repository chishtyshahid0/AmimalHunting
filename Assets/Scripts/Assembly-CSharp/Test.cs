using UnityEngine;

public class Test : MonoBehaviour
{
	public GameObject test2Obj;

	private void Start()
	{
		iTween.CameraFadeAdd();
		iTween.CameraFadeFrom(1f, 3f);
		Debug.Log(string.Empty + test2Obj.transform.GetComponent<Testing>().score);
	}

	private void Update()
	{
		Invoke("UpdateFramesCheck", 1f);
	}

	private void UpdateFramesCheck()
	{
		Debug.Log("update ");
	}
}
