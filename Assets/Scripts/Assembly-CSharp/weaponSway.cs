using UnityEngine;

public class weaponSway : MonoBehaviour
{
	public float maxrotate = 15f;

	public Transform myCamera;

	private Vector3 originalLocalRot;

	public bool doaim;

	public float speed = 2f;

	public float smooth = 0.3f;

	public float Ytilt;

	public float Xtilt;

	private float clamp;

	private Vector3 prevRotation;

	private void Start()
	{
		originalLocalRot = base.transform.localEulerAngles;
		prevRotation = myCamera.transform.eulerAngles;
	}

	private void LateUpdate()
	{
		if (doaim)
		{
			clamp = maxrotate / 6f;
		}
		else
		{
			clamp = maxrotate;
		}
		Vector3 vector = (myCamera.transform.eulerAngles - prevRotation) / Time.deltaTime;
		prevRotation = myCamera.transform.eulerAngles;
		Ytilt = vector.y / 20f;
		Xtilt = vector.x / 20f;
		Ytilt = Mathf.Floor(Ytilt);
		Xtilt = Mathf.Floor(Xtilt);
		Ytilt = Mathf.Clamp(Ytilt, 0f - clamp, clamp);
		Xtilt = Mathf.Clamp(Xtilt, 0f - clamp, clamp);
		Vector3 euler = new Vector3(originalLocalRot.x - Xtilt, originalLocalRot.y - Ytilt, originalLocalRot.z);
		if (Time.deltaTime != 0f)
		{
			base.transform.localRotation = Quaternion.Lerp(base.transform.localRotation, Quaternion.Euler(euler), smooth * Time.deltaTime * speed);
		}
	}
}
