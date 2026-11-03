using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class genericShooter : MonoBehaviour
{
	public static genericShooter myScript;

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

	public List<GameObject> Bulletshells;

	public Camera Cam;

	public bool Ignorenow;

	private playercontroller playerscript;

	[Header("Bullet Follow Properties")]
	public GameObject Bullet;

	public Transform BulletPosition;

	public Transform[] CameraPosition;

	private bool isBulletMoving;

	public bool isRightplace;

	private GameObject obj_BullettoFollow;

	private void Awake()
	{
		myScript = this;
	}

	private void Start()
	{
		GetComponent<Animation>().Stop();
		onstart();
		muzzle.gameObject.SetActive(false);
		playerscript = player.GetComponent<playercontroller>();
	}

	private void Update()
	{
        ////
        if (Ignorenow)
        {
            return;
        }
        if (BulletSlowmoFollowCam.Instance != null && BulletSlowmoFollowCam.Instance.IsActive())
        {
            return; // slow-mo cam chal rahi hai, fire/aim band
        }
		/////
        if (Ignorenow)
		{
			return;
		}
		audioTime = myAudioSource.time;
		frame = GetComponent<Animation>()[reloadAnim.name].normalizedTime;
		float maxDistanceDelta = speed * Time.deltaTime;
		float num = Mathf.Lerp(Cam.fieldOfView, nextField, Time.deltaTime * 5f);
		float fieldOfView = Mathf.Lerp(weaponcamera.fieldOfView, weaponnextfield, Time.deltaTime * 2f);
		Cam.fieldOfView = num;
		weaponcamera.fieldOfView = fieldOfView;
		CameraControllesAssaults._targetFieldOfView = num;
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
			base.transform.localPosition = Vector3.MoveTowards(base.transform.localPosition, aimposition, maxDistanceDelta);
			if (!isBulletMoving)
			{
				StartCoroutine(CamSwitching( false, true));
			}
			else
			{
				StartCoroutine(CamSwitching(true,  false));
			}
			weaponnextfield = weaponaimFOV;
			nextField = aimFOV;
			playerscript.canrun = false;
		}
		else
		{
			inaccuracy = spreadNormal;
			component.doaim = false;
			base.transform.localPosition = Vector3.MoveTowards(base.transform.localPosition, normalposition, maxDistanceDelta);
			StartCoroutine(CamSwitching(true, false));
			weaponnextfield = weaponnormalFOV;
			nextField = normalFOV;
			playerscript.canrun = true;
		}
		if (currentammo <= 0)
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
			else if (!isBulletMoving)
			{
                print("1");
                reload();
			}
		}
		if (UIcontrol.Enableshoot && canfire && !isreloading)
		{
            Debug.Log("Fire Click 0");
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
		Hands.GetComponent<SkinnedMeshRenderer>().enabled = Is_CamState;
		if (UIcontrol.Obj != null)
		{
			UIcontrol.Obj.Sniperscope.enabled = !Is_CamState;
		}
	}

	public void OnShoot()
	{
		Is_ReadyShoot = true;
		isBulletMoving = false;
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
		GetComponent<Animation>().Stop();
		if (isreloading)
		{
            print("2");
            reload();
			return;
		}
		clipShell.gameObject.SetActive(true);
		myAudioSource.time = 0f;
		myAudioSource.clip = readySound;
		myAudioSource.loop = false;
		myAudioSource.volume = 1f;
		myAudioSource.Play();
		GetComponent<Animation>().Play(readyAnim.name);
		canfire = true;
	}

	public void CheckFire(bool Is_FireInput)
	{
		if (canfire && !isreloading)
		{
			Is_Fire = Is_FireInput;
		}
	}
    int firewait = 0;
    public float Fire_Rate = 0.5f;
    void waitfor()
    {
        firewait = 0;
    }
	public void fire()
	{
        //if (!GetComponent<Animation>().isPlaying)
        //Managing In My Way....
        if (firewait == 0 )
        {
            firewait = 1;
            Invoke("waitfor", Fire_Rate);
            Is_ReadyShoot = false;
			Invoke("OnShoot", DelayForShoot);
			ParticleSystem[] componentsInChildren = muzzle.GetComponentsInChildren<ParticleSystem>();
			if (!muzzle.gameObject.activeSelf)
			{
				muzzle.gameObject.SetActive(true);
			}
			raycastfire component = rayfirer.GetComponent<raycastfire>();
			component.SendMessage("fire", SendMessageOptions.DontRequireReceiver);
			fireAudioSource.clip = fireSound;
			fireAudioSource.pitch = 0.98f + 0.1f * Random.value;
			fireAudioSource.Play();
			GetComponent<Animation>()[fireAnim.name].speed = fireAnimSpeed;
			GetComponent<Animation>().Play(fireAnim.name);
			currentammo--;
			StartCoroutine(ejectshell(shellejectdelay));
			if (currentammo <= 0)
			{
				Is_Fire = false;
                print("3");
                reload();
                if(UIcontrol.Enablezoom)
                    UIcontrol.Obj.CheckZoomstatus();
			}
		}
       // print("sHOOT fUN end");
    }

	private void reload()
    {
        //print("Outside Reloading Fun....");
        if (!GetComponent<Animation>().isPlaying && canreload)
		{
            //print("Inside Reloading Fun....");
			float time = audioTime;
			float num = GetComponent<Animation>()[reloadAnim.name].length * frame;
			StartCoroutine(setreload(GetComponent<Animation>()[reloadAnim.name].length - num));
			StartCoroutine(deactivateShell(GetComponent<Animation>()[reloadAnim.name].length * 0.5f - num));
			myAudioSource.clip = reloadSound;
			myAudioSource.loop = false;
			myAudioSource.volume = 1f;
			myAudioSource.time = time;
			myAudioSource.Play();
			GetComponent<Animation>()[reloadAnim.name].time = num;
			GetComponent<Animation>().Play(reloadAnim.name);
			ammoToReload = Mathf.Clamp(ammoToReload, ammoToReload, ammo);
			ammo -= ammoToReload;
			currentammo += ammoToReload;
			if (UIcontrol.Obj)
			{
				UIcontrol.Obj.Sniperscope.enabled = false;
			}
			if (Tutorial.Obj && Tutorial.Obj.count == 2)
			{
				Tutorial.Obj.count = 3;
				Tutorial.Obj.Enabletexts(3);
				Tutorial.Obj.Shootbtn.raycastTarget = false;
			}
		}
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

	public void CreateBullet(Vector3 posToMove)
	{
		isBulletMoving = true;
		CancelInvoke("OnShoot");
		if (Random.Range(0, CameraPosition.Length) == 0)
		{
			isRightplace = false;
		}
		else
		{
			isRightplace = true;
		}
		Invoke("SetToMoveCamera", 0.75f);
	}

	private void SetToMoveCamera()
	{
		obj_BullettoFollow.transform.parent = null;
	}
}
