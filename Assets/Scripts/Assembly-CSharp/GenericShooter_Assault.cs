using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GenericShooter_Assault : MonoBehaviour
{
	public static GenericShooter_Assault myScript;

	public Vector3 normalposition;

	public Vector3 aimposition;

	public float aimFOV = 45f;

	public float normalFOV = 65f;

	public float weaponnormalFOV = 32f;

	public float weaponaimFOV = 20f;

	public float speed;

	public Transform player;

	public Transform weaponRoot;

	public bool twohanded;

	public AudioSource myAudioSource;

	public AudioSource fireAudioSource;

	public AudioClip emptySound;

	public AudioClip fireSound;

	public AudioClip readySound;

	public AudioClip reloadSound;

	public int ammoToReload = 20;

	public int projectilecount = 1;

	public float inaccuracy = 0.02f;

	public float spreadNormal = 0.08f;

	public float spreadAim = 0.02f;

	public float force = 500f;

	public float damage = 50f;

	public float range = 100f;

	public float smoothdamping = 2f;

	public LayerMask mask;

	public AnimationClip fireAnim;

	public float fireAnimSpeed = 1.1f;

	public AnimationClip reloadAnim;

	public AnimationClip reloadClip;

	public AnimationClip readyAnim;

	public GameObject shell;

	public Transform shellPos;

	public float shellejectdelay;

	public int ammo = 200;

	public int currentammo = 20;

	public Transform muzzle;

	public GameObject SniperBullet;

	public Transform clipShell;

	public Vector3 retractPos;

	public Camera weaponcamera;

	private float nextField;

	private float weaponnextfield;

	private bool canaim = true;

	private bool retract;

	private bool canfire = true;

	private bool canreload = true;

	private bool isreloading;

	public Transform rayfirer;

	private float frame;

	private float audioTime;

	public bool Is_Fire;

	public bool Is_ReadyShoot;

	public float DelayForShoot;

	public GameObject Gun;

	public GameObject Scope;

	public GameObject Hands;

	public GameObject[] GunMesh;

	public bool Is_ZoomMode;

	public float ZoomMiltiplier;

	public GameObject PointerOnScreen;

	public bool Ignorenow;

	public List<GameObject> Bulletshells;

	public Camera Cam;

	private playercontroller playerscript;

	public bool Is_ReadyToFire;

	private void Awake()
	{
		myScript = this;
	}

	private void Start()
	{
		GetComponent<Animator>().SetInteger("AnimCount", 0);
		onstart();
		MakeReady();
		muzzle.gameObject.SetActive(false);
		playerscript = player.GetComponent<playercontroller>();
	}

	private void Update()
	{
		if (Ignorenow)
		{
			return;
		}
		audioTime = myAudioSource.time;
		float num = speed * Time.deltaTime;
		float num2 = Mathf.Lerp(Cam.fieldOfView, nextField, Time.deltaTime * 5f);
		float fieldOfView = Mathf.Lerp(weaponcamera.fieldOfView, weaponnextfield, Time.deltaTime * 5f);
		Cam.fieldOfView = num2;
		weaponcamera.fieldOfView = fieldOfView;
		CameraControllesAssaults._targetFieldOfView = num2;
		bool running = playerscript.running;
		if (retract)
		{
			canfire = false;
			base.transform.localPosition = Vector3.MoveTowards(base.transform.localPosition, retractPos, 5f * Time.deltaTime);
			weaponnextfield = weaponnormalFOV;
			nextField = normalFOV;
		}
		weaponSway component = GetComponent<weaponSway>();
		if ((Input.GetKey(KeyCode.Z) || UIcontrol.Enablezoom) && canaim)
		{
			inaccuracy = spreadAim;
			component.doaim = true;
			base.transform.localPosition = Vector3.MoveTowards(base.transform.localPosition, aimposition, num * 2f);
			StartCoroutine(CamSwitching(Is_CamState: false, Is_ScopeState: true));
			weaponnextfield = weaponaimFOV;
			nextField = aimFOV;
			playerscript.canrun = false;
		}
		else
		{
			inaccuracy = spreadNormal;
			component.doaim = false;
			base.transform.localPosition = Vector3.MoveTowards(base.transform.localPosition, normalposition, num);
			StartCoroutine(CamSwitching(Is_CamState: true, Is_ScopeState: false));
			weaponnextfield = weaponnormalFOV;
			nextField = normalFOV;
			playerscript.canrun = true;
		}
		if (currentammo == 0 || currentammo <= 0)
		{
			if (ammo <= 0)
			{
				canfire = false;
				canreload = false;
				if (Input.GetButtonDown("Fire1"))
				{
					myAudioSource.PlayOneShot(emptySound);
				}
				else
				{
					canreload = true;
				}
			}
			else
			{
				reload();
			}
		}
		if (UIcontrol.Enableshoot && canfire && !isreloading)
		{
			fire();
		}
		if (Is_Fire && Is_ReadyShoot)
		{
			fire();
		}
	}

	public IEnumerator CamSwitching(bool Is_CamState, bool Is_ScopeState)
	{
		yield return new WaitForSeconds(0.05f);
		for (int i = 0; i < GunMesh.Length; i++)
		{
			if (GunMesh[i].GetComponent<MeshRenderer>() != null)
			{
				GunMesh[i].GetComponent<MeshRenderer>().enabled = Is_CamState;
			}
		}
	}

	private void OnShoot()
	{
		Is_ReadyShoot = true;
	}

	public void SetZoom(bool Is_ZoomState)
	{
		Is_ZoomMode = Is_ZoomState;
	}

	private void onstart()
	{
		myAudioSource.Stop();
		fireAudioSource.Stop();
		retract = false;
		Animator component = weaponRoot.GetComponent<Animator>();
		component.SetBool("twohanded", twohanded);
		raycastfire component2 = rayfirer.GetComponent<raycastfire>();
		component2.inaccuracy = inaccuracy;
		component2.damage = damage;
		component2.range = range;
		component2.force = force;
		component2.projectilecount = projectilecount;
		GetComponent<Animator>().SetInteger("AnimCount", 0);
		if (isreloading)
		{
			reload();
			return;
		}
		clipShell.gameObject.SetActive(true);
		myAudioSource.time = 0f;
		myAudioSource.clip = readySound;
		myAudioSource.loop = false;
		myAudioSource.volume = 1f;
		myAudioSource.Play();
		canfire = true;
	}

	public void CheckFire(bool Is_FireInput)
	{
		if (canfire && !isreloading)
		{
			Is_Fire = Is_FireInput;
		}
	}

	public void MakeReady()
	{
		Is_ReadyToFire = true;
	}

	public void fire()
	{
		if (GetComponent<Animator>().GetInteger("AnimCount") == 0)
		{
			Debug.Log("Fire :");
			Is_ReadyToFire = false;
			Is_ReadyShoot = false;
			Invoke("OnShoot", DelayForShoot);
			if (!muzzle.gameObject.activeSelf)
			{
				muzzle.gameObject.SetActive(true);
			}
			raycastfire component = rayfirer.GetComponent<raycastfire>();
			component.SendMessage("fire", SendMessageOptions.DontRequireReceiver);
			fireAudioSource.clip = fireSound;
			fireAudioSource.pitch = 0.98f + 0.1f * Random.value;
			fireAudioSource.Play();
			GetComponent<Animator>().SetInteger("AnimCount", 1);
			currentammo--;
			StartCoroutine(ejectshell(shellejectdelay));
			if (currentammo <= 0)
			{
				Is_Fire = false;
				reload();
			}
			else
			{
				Invoke("AnimExit", 0.1f);
				Invoke("MakeReady", 0.2f);
			}
		}
	}

	public void AnimExit()
	{
		GetComponent<Animator>().SetInteger("AnimCount", 0);
	}

	public void reload()
	{
		float time = audioTime;
		StartCoroutine(setreload(1.35f));
		StartCoroutine(deactivateShell(1.5f));
		myAudioSource.clip = reloadSound;
		myAudioSource.loop = false;
		myAudioSource.volume = 1f;
		myAudioSource.time = time;
		myAudioSource.Play();
		GetComponent<Animator>().SetInteger("AnimCount", 2);
		Invoke("ReloadClip", 0.75f);
		ammoToReload = Mathf.Clamp(ammoToReload, ammoToReload, ammo);
		ammo -= ammoToReload;
		if (currentammo != ammoToReload)
		{
			currentammo = ammoToReload;
		}
		if ((bool)Tutorial.Obj && Tutorial.Obj.count == 2)
		{
			Tutorial.Obj.count = 3;
			Tutorial.Obj.Enabletexts(3);
			Tutorial.Obj.Shootbtn.raycastTarget = false;
		}
	}

	public void ReloadClip()
	{
		GetComponent<Animator>().SetInteger("AnimCount", 3);
		Invoke("AnimExit", 1f);
		Invoke("MakeReady", 1f);
	}

	private void doRetract()
	{
		retract = true;
	}

	private void doNormal()
	{
		retract = false;
		onstart();
	}

	private IEnumerator ejectshell(float waitTime)
	{
		yield return new WaitForSeconds(waitTime);
		if (Bulletshells.Count < 10)
		{
			GameObject gameObject = Object.Instantiate(shell, shellPos.transform.position, shellPos.transform.rotation);
			gameObject.GetComponent<Rigidbody>().AddRelativeForce(20f, 80f, 0f);
			gameObject.GetComponent<Rigidbody>().AddRelativeTorque(35f, 45f, 0f);
			Bulletshells.Add(gameObject);
			yield break;
		}
		for (int i = 0; i < Bulletshells.Count; i++)
		{
			if (!Bulletshells[i].activeSelf)
			{
				Bulletshells[i].GetComponent<Rigidbody>().velocity = Vector3.zero;
				Bulletshells[i].GetComponent<Rigidbody>().angularVelocity = Vector3.zero;
				Bulletshells[i].SetActive(true);
				Bulletshells[i].transform.localPosition = shellPos.transform.position;
				Bulletshells[i].transform.localRotation = shellPos.transform.rotation;
				Bulletshells[i].GetComponent<Rigidbody>().AddRelativeForce(20f, 80f, 0f);
				Bulletshells[i].GetComponent<Rigidbody>().AddRelativeTorque(35f, 45f, 0f);
				break;
			}
		}
	}

	private IEnumerator deactivateShell(float waitTime)
	{
		clipShell.gameObject.SetActive(false);
		yield return new WaitForSeconds(waitTime);
		clipShell.gameObject.SetActive(true);
	}

	private IEnumerator setreload(float waitTime)
	{
		isreloading = true;
		canaim = false;
		yield return new WaitForSeconds(waitTime);
		isreloading = false;
		canaim = true;
	}
}
