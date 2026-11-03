using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class playercontroller : MonoBehaviour
{
	public int currentGun;

	public int currentLevel;

	public Transform mycamera;

	private Transform reference;

	public float jumpHeight = 2f;

	public float jumpinterval = 1.5f;

	private float nextjump = 1.2f;

	public float hitpoints = 100f;

	private float stepinterval;

	private float nextstep = 0.5f;

	public float gravity = 20f;

	public float rotatespeed = 4f;

	public float speed = 4f;

	public float runspeed = 8f;

	public float dampTime = 2f;

	public AudioClip[] footSounds;

	public AudioClip[] Jumpsounds;

	public AudioClip[] Hurtsounds;

	private float moveAmount;

	public float smoothSpeed = 2f;

	private Vector3 forward = Vector3.forward;

	private Vector3 moveDirection = Vector3.zero;

	private Vector3 right;

	public Transform weaponRoot;

	public bool running;

	public bool canrun = true;

	public bool isenabled = true;

	public AudioSource myAudioSource;

	public AudioSource Hurtsoundsource;

	public bool mb_AutoMove;

	public Virtualjoystick _Joystickinput;

	public static playercontroller Obj;

	public bool Finalbulletnow;

	public bool IsDead;

	public GameObject Lookobj;

	public Animator Playercamanim;

	private UIcontrol _UIcontrolref;

	public List<GameObject> Allguns;

	public int[] WeaponDamagevalues;

	public int Assignweapondamagevalue;

	public float maxMoveAmount;

	public float movespeed;

	public static bool cameFromMenu;

	public bool isAnimalEscaped;

	private Vector3 xValue;

	private Vector3 rot;

	private Vector3 pos;

	private Vector3 Mapiconpos;

	private Vector3 Mapiconrot;

	private Vector3 tempV;

	private Animator animator;

	private Vector3 targetDirection;

	public CharacterController controller;

	private float hor;

	private float ver;

	[HideInInspector]
	public bool moveRight;

	[HideInInspector]
	public bool moveLeft;

	private float _walkspeed = 6f;

	public GameObject Finalset;
    //[HideInInspector]
    public static int TotalKills;
	private void Awake()
	{
        TotalKills = 0;
           reference = new GameObject().transform;
		controller = GetComponent<CharacterController>();
		Obj = this;
		Debug.Log("came from menu : " + cameFromMenu);
		Assignweapondamagevalue = WeaponDamagevalues[GameEnum.currentGun];
	}

	private void Start()
	{
        if (cameFromMenu)
        {
            currentGun = UpgradeGuns._instance.gunIndex;
            currentLevel = LevelSelection.levelNumber - 1;
            for (int i = 0; i < Allguns.Count; i++)
            {
                Allguns[currentGun].SetActive(true);
            }
        }
        else
        {
            GameEnum.currentGun = currentGun - 1;
            GameEnum.currentLevel = currentLevel - 1;
            currentLevel = LevelManager._instance.TestingIndex;
            for (int k = 0; k < Allguns.Count; k++)
            {
                Allguns[GameEnum.currentGun].SetActive(true);
            }
        }
        if (UIcontrol.Obj!=null)
		{
			_UIcontrolref = UIcontrol.Obj;
		}
		_UIcontrolref.Allcontrols.SetActive(false);
		UIcontrol.Obj.levelDescriptionObj.SetActive(true);
        if (GameManager.MODE_Hard)
        {
            UIcontrol.Obj.levelDescriptionTxt.text = LevelDetails._instance.levelDescription;
            transform.position = LevelDetails._instance.startPoint.transform.position;
            transform.rotation = LevelDetails._instance.startPoint.transform.rotation;
        }
        else if (GameManager.MODE_Easy || GameManager.MODE_AnimalWdNameX)
        {
            TotalKills = LevelManager._instance.TargetCount[currentLevel];
            UIcontrol.Obj.levelDescriptionTxt.text = "Kill " + TotalKills + " " + LevelManager._instance.EnemyName[currentLevel] + " in the given time ....!";
            int Rand = Random.Range(0, GameManager._instance.PlayerPosition.Length);
            transform.position = GameManager._instance.PlayerPosition[Rand].position;
            transform.rotation = GameManager._instance.PlayerPosition[Rand].rotation;
        }
        mycamera.GetComponent<Camera>().enabled = false;
		UIcontrol.Obj.CheckControlButtons();
		Scene activeScene = SceneManager.GetActiveScene();

		Debug.Log("current x Value:" + base.transform.position.x);
		xValue = mycamera.transform.position;
		PageHandler.isGameManager = true;
	}

    
	private void FixedUpdate()
	{
		reference.eulerAngles = new Vector3(0f, mycamera.eulerAngles.y, 0f);
		forward = reference.forward;
		right = new Vector3(forward.z, 0f, 0f - forward.x);
		hor = _Joystickinput.Horizontal();
		ver = _Joystickinput.Vertical();
		animator = weaponRoot.GetComponent<Animator>();
		targetDirection = hor * right + ver * forward;
		if (isenabled)
		{
			controller.enabled = true;
			Vector3 velocity = controller.velocity;
			float magnitude = new Vector3(velocity.x, 0f, velocity.z).magnitude;
			animator.SetBool("grounded", controller.isGrounded);
			stepinterval = 3f / magnitude;
			if (!raycastfire.IsShooting && !UIcontrol.Enablezoom && !UIcontrol.CheckCrouch)
			{
				animator.SetFloat("speed", magnitude, dampTime, 0.2f);
				speed = runspeed;
			}
			else
			{
				animator.SetFloat("speed", 0f, dampTime, 1f);
				speed = 4f;
			}
			Vector3 vector = targetDirection;
			if (controller.isGrounded)
			{
				if ((Input.GetButton("Jump") || UIcontrol.CheckJump) && Time.time > nextjump)
				{
					nextjump = Time.time + jumpinterval;
					moveDirection.y = jumpHeight;
					animator.SetBool("jump", value: true);
				}
				else
				{
					if (animator.GetBool("jump"))
					{
						Hurtsoundsource.clip = Jumpsounds[0];
						Hurtsoundsource.Play();
					}
					animator.SetBool("jump", value: false);
				}
				if (magnitude >= 0.25f && !myAudioSource.isPlaying && Time.time > nextstep)
				{
					nextstep = Time.time + stepinterval;
					myAudioSource.clip = footSounds[Random.Range(0, footSounds.Length)];
					myAudioSource.pitch = 0.98f + 0.1f * Random.value;
					myAudioSource.Play();
				}
			}
			else
			{
				moveDirection.y -= gravity * Time.deltaTime;
				nextjump = Time.time + jumpinterval;
			}
			vector *= speed;
			running = false;
			moveDirection.z = vector.z;
			moveDirection.x = vector.x;
			if (controller.enabled)
			{
				controller.Move(moveDirection * Time.deltaTime);
			}
			if (controller.velocity.magnitude > 2f)
			{
				running = true;
			}
		}
		if (moveRight && !(mycamera.transform.position.x >= xValue.x + maxMoveAmount))
		{
			Vector3 target = new Vector3(LevelDetails._instance.transform.localPosition.x + maxMoveAmount, mycamera.transform.localPosition.y, mycamera.transform.localPosition.z);
			mycamera.transform.localPosition = Vector3.MoveTowards(mycamera.transform.localPosition, target, movespeed * Time.deltaTime);
		}
		if (moveLeft && !(mycamera.transform.position.x <= xValue.x - maxMoveAmount))
		{
			Vector3 target2 = new Vector3(LevelDetails._instance.transform.localPosition.x - maxMoveAmount, mycamera.transform.localPosition.y, mycamera.transform.localPosition.z);
			mycamera.transform.localPosition = Vector3.MoveTowards(mycamera.transform.localPosition, target2, movespeed * Time.deltaTime);
		}
		if (mb_AutoMove)
		{
			controller.enabled = true;
			if (_walkspeed < 8f)
			{
				_walkspeed += 4.5f * Time.deltaTime;
			}
			animator.SetFloat("speed", _walkspeed, dampTime, 0.4f);
			if (_walkspeed >= 0.5f && !myAudioSource.isPlaying && Time.time > nextstep)
			{
				stepinterval = 3f / _walkspeed;
				nextstep = Time.time + stepinterval;
				myAudioSource.clip = footSounds[Random.Range(0, footSounds.Length)];
				myAudioSource.pitch = 0.98f + 0.1f * Random.value;
				myAudioSource.Play();
			}
		}
		else
		{
			controller.enabled = false;
		}
	}

	public void DamagePlayer(float damage = 1f)
	{
		if (!IsDead && !Finalbulletnow)
		{
			hitpoints -= damage;
			if (hitpoints <= 0f)
			{
				IsDead = true;
				Debug.Log("Dead now...");
				_UIcontrolref.Resumecount++;
				_UIcontrolref.ShowLevelFail();
			}
			_UIcontrolref.Healthvalue.fillAmount = hitpoints / 100f;
			if (hitpoints > 60f)
			{
				_UIcontrolref.Hiteffect.sprite = _UIcontrolref.Bloodlevel1;
			}
			else if (hitpoints > 30f)
			{
				_UIcontrolref.Hiteffect.sprite = _UIcontrolref.Bloodlevel2;
			}
			else
			{
				_UIcontrolref.Hiteffect.sprite = _UIcontrolref.Bloodlevel3;
			}
			if (!Hurtsoundsource.isPlaying)
			{
				Hurtsoundsource.clip = Hurtsounds[Random.Range(0, Hurtsounds.Length)];
				Hurtsoundsource.Play();
			}
			_UIcontrolref.Hiteffect.gameObject.SetActive(true);
		}
	}

	public void Enablefinalbulletnow()
	{
		if (!Finalbulletnow)
		{
			if (mycamera.GetComponent<CameraControllesAssaults>() != null)
			{
				mycamera.GetComponent<CameraControllesAssaults>().enabled = false;
			}
			if (CameraControllesAssaults.myScript != null)
			{
				CameraControllesAssaults.myScript.Ignorenow = true;
			}
			if (UIcontrol.Obj != null)
			{
				UIcontrol.Obj.Allcontrols.transform.localScale = Vector3.zero;
			}
			Finalbulletnow = true;
			Finalset.SetActive(true);
		}
	}

	private void OnTriggerEnter(Collider col)
	{
		Debug.Log("triggered to : " + col.gameObject.name);
		if (col.gameObject.CompareTag("NextWaveTrigger"))
		{
			Debug.Log("enable targets : ");
			col.gameObject.SetActive(false);
			LevelDetails._instance.EnableCurrentWaveAnimals();
		}
	}
}
