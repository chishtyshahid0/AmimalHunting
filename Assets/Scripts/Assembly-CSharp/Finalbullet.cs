using UnityEngine;

public class Finalbullet : MonoBehaviour
{
	public Rigidbody Bulletobj;

	public Camera Maincamera;

	public Camera Weaponcamera;

	public Camera Followcamera;

	public Transform Followobj;

	public Transform Bullettransform;

	public Animator[] Allanimators;

	public Animation[] Allanimationsref;

	public Vector3 pos;

	public Vector3 rot;

	public bool Lookcharacternow;

	public bool Movenow;

	private float speed = 0.5f;

	public static Vector3 Finalcharacterpos;

	public static Vector3 Finalcampos;

	public static Vector3 Finalcamrot;

	private float distance;

	public AudioClip[] Clips;

	public AudioSource Source;

	public Vector3[] Allgunspos;

	public Vector3[] Allgunsrot;

	public GameObject[] Allweapons;

	private RaycastHit hit;

	private GameObject Characterobj;

	private void OnEnable()
	{
		Maincamera.cullingMask = 0;
		Weaponcamera.cullingMask = 0;
		for (int i = 0; i < Allweapons.Length; i++)
		{
			Allweapons[i].SetActive(false);
		}
		Allweapons[0].SetActive(true);
		Allanimators[0].transform.localScale = Vector3.zero;
		Followcamera.fieldOfView = 15f;
		Bulletobj.isKinematic = false;
		Invoke("Enablemovenow", 0.15f);
		distance = Vector3.Distance(playercontroller.Obj.transform.position, Finalcharacterpos);
		if ((bool)Source)
		{
			Source.clip = Clips[0];
			Source.loop = false;
			Source.Play();
		}
	}

	private void Enablemovenow()
	{
		Movenow = true;
	}

	private void Enabletimescalenow()
	{
		Time.timeScale = 1f;
	}

	private void FixedUpdate()
	{
		if (!Movenow)
		{
			return;
		}
		Bulletobj.velocity = base.transform.forward * speed;
		speed += 0.5f;
		speed = Mathf.Clamp(speed, 0.5f, distance / 2f);
		Followcamera.fieldOfView += 0.5f;
		Followcamera.fieldOfView = Mathf.Clamp(Followcamera.fieldOfView, 15f, 80f);
		Bullettransform.transform.Rotate(0f, 0f, 50f);
		if (Physics.Raycast(base.transform.position, base.transform.forward, out hit, 0.5f) && !Lookcharacternow)
		{
			Bulletobj.isKinematic = true;
			Lookcharacternow = true;
			Characterobj = hit.transform.gameObject;
			Bullettransform.gameObject.SetActive(false);
			if ((bool)UIcontrol.Obj)
			{
				UIcontrol.Obj.Invoke("ShowLevelComplete", 3f);
			}
		}
	}

	private void LateUpdate()
	{
		if (!Lookcharacternow)
		{
			Followcamera.transform.LookAt(Bulletobj.transform); 
		}
		else
		{
			Followcamera.transform.LookAt(Characterobj.transform);
		}
	}

	public void Enablefinalbullet()
	{
	}

	private void OnTriggerEnter(Collider col)
	{
	}
}
