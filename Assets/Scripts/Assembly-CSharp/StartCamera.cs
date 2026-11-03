using System.Collections;
using UnityEngine;

public class StartCamera : MonoBehaviour
{
	public Transform point_1;

	public Transform point_2;

	public Transform point_3;

	public Camera startCam;

	public GameObject mainCam;

	public float timeOfCamAnim = 3f;

	public static StartCamera _instance;

	public Transform target;

	private void Awake()
	{
		_instance = this;
	}

	private void Start()
	{
		CamPositionOne();
		if (target == null)
		{
            if (GameManager.MODE_Hard) target = LevelDetails._instance.allTargetAnimals[0].transform;
            else target = LevelManager._instance.Animals[0].transform;
        }
		mainCam = GameObject.FindGameObjectWithTag("MainCamera");
	}

	private void CamPositionOne()
	{
		startCam.transform.position = point_1.transform.position;
		if (point_2 != null)
		{
			iTween.MoveTo(startCam.gameObject, iTween.Hash("x", startCam.transform.position.x - 30f, "time", timeOfCamAnim, "easetype", iTween.EaseType.linear));
			StartCoroutine(CameraFade(timeOfCamAnim - 0.5f));
			Invoke("CamPositionTwo", timeOfCamAnim);
		}
	}

	private void CamPositionTwo()
	{
		startCam.transform.position = point_2.transform.position;
		iTween.MoveTo(startCam.gameObject, iTween.Hash("x", startCam.transform.position.x + 40f, "time", timeOfCamAnim, "easetype", iTween.EaseType.linear));
		StartCoroutine(CameraFade(timeOfCamAnim - 0.5f));
		Invoke("CamPositionThree", timeOfCamAnim);
	}

	private void CamPositionThree()
	{
		startCam.transform.position = point_3.transform.position;
		iTween.MoveTo(startCam.gameObject, iTween.Hash("z", startCam.transform.position.z - 20f, "time", timeOfCamAnim, "easetype", iTween.EaseType.linear));
		StartCoroutine(CameraFade(timeOfCamAnim - 0.5f));
		Invoke("CamPositionOne", timeOfCamAnim);
		if (!UIcontrol.Obj.startGame)
		{
		}
	}

	private IEnumerator CameraFade(float waitTime)
	{
		yield return new WaitForSeconds(waitTime);
		Debug.Log("fade cam");
		iTween.CameraFadeAdd();
		iTween.CameraFadeTo(1f, 1f);
		yield return new WaitForSeconds(0.5f);
		Debug.Log("fade cam out");
		iTween.CameraFadeAdd();
		iTween.CameraFadeTo(0f, 1f);
	}

	private void LateUpdate()
	{
		startCam.transform.LookAt(target);
	}

	private void OnDisable()
	{
		CancelInvoke("CamPositionOne");
		CancelInvoke("CamPositionTwo");
		CancelInvoke("CamPositionThree");
		Debug.Log("cancle all invokes");
	}
}
