using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class raycastfire : MonoBehaviour
{
	public static raycastfire _instance;

	public float force = 500f;

	public float damage = 50f;

	public float range = 100f;

	public LayerMask mask;

	public int projectilecount = 1;

	public float inaccuracy = 0.1f;

	public GameObject impactnormal;

	public GameObject impactnormalparticle;

	public GameObject BloodPart;

	public GameObject BloodPart2;

	[Header("Upgrade Values ")]
	public float mf_Range;

	public float mf_DamgeVal = 50f;

	public static bool IsShooting;

	public Camera Cam;

	public List<GameObject> Allbulletshots;

	public List<GameObject> Allbulletimpactparticle;

	public int Damagevalue = 50;

	private UIcontrol _UIcontrolref;

	[HideInInspector]
	public bool firstTimeBulletFire = true;

	public Animator Playershakeanim;

	private float timeval;

	private float Maxtimeval;

	public RaycastHit hit = default(RaycastHit);

	public RaycastHit Updatehit = default(RaycastHit);

	public int mi_HeadShots;

	public int mi_LungShots;

	public int mi_BrainShots;

	public int mi_HeartShots;

	private void Awake()
	{
		_instance = this;
	}

	private void Start()
	{
		for (int i = 0; i < 10; i++)
		{
			GameObject gameObject = Object.Instantiate(impactnormal, Vector3.zero, Quaternion.identity);
			gameObject.SetActive(false);
			Allbulletshots.Add(gameObject);
		}
		for (int j = 0; j < 10; j++)
		{
			GameObject gameObject2 = Object.Instantiate(impactnormalparticle, Vector3.zero, Quaternion.identity);
			gameObject2.SetActive(false);
			Allbulletimpactparticle.Add(gameObject2);
		}
		if (playercontroller.Obj != null)
		{
			Damagevalue = playercontroller.Obj.Assignweapondamagevalue;
		}
		Debug.Log("gun damage value assined : " + Damagevalue);
		if (UIcontrol.Obj != null)
		{
			_UIcontrolref = UIcontrol.Obj;
		}

		// Create yellow indicator dot over crosshair/scope center
		CreateAimIndicatorDot();
	}

	[Header("Aim Indicator Dot")]
	public Image aimIndicatorDot;

	private void CreateAimIndicatorDot()
	{
		if (aimIndicatorDot != null) return;

		// Attach to Canvas
		Canvas canvas = Object.FindObjectOfType<Canvas>();
		if (canvas != null)
		{
			GameObject dotObj = new GameObject("AnimalAim_YellowDot");
			dotObj.transform.SetParent(canvas.transform, false);

			aimIndicatorDot = dotObj.AddComponent<Image>();
			aimIndicatorDot.color = new Color(1f, 0.92f, 0.016f, 0.95f); // bright yellow
			aimIndicatorDot.raycastTarget = false;

			// Circular sprite if available, or nice smooth circle
			Texture2D circleTex = new Texture2D(32, 32);
			Color[] colors = new Color[32 * 32];
			float r = 15f;
			Vector2 center = new Vector2(15.5f, 15.5f);
			for (int y = 0; y < 32; y++)
			{
				for (int x = 0; x < 32; x++)
				{
					float dist = Vector2.Distance(new Vector2(x, y), center);
					if (dist <= r)
					{
						float alpha = Mathf.Clamp01((r - dist) * 1.5f);
						colors[y * 32 + x] = new Color(1f, 1f, 1f, alpha);
					}
					else
					{
						colors[y * 32 + x] = Color.clear;
					}
				}
			}
			circleTex.SetPixels(colors);
			circleTex.Apply();
			aimIndicatorDot.sprite = Sprite.Create(circleTex, new Rect(0, 0, 32, 32), new Vector2(0.5f, 0.5f));

			RectTransform rt = aimIndicatorDot.rectTransform;
			rt.anchorMin = new Vector2(0.5f, 0.5f);
			rt.anchorMax = new Vector2(0.5f, 0.5f);
			rt.pivot = new Vector2(0.5f, 0.5f);
			rt.anchoredPosition = Vector2.zero; // Exactly at screen center over crosshair dot
			rt.sizeDelta = new Vector2(14f, 14f);

			dotObj.SetActive(false);
		}
	}

	private void Update()
	{
		Debug.DrawRay(base.transform.position, base.transform.forward * 500f, Color.red);
		
		bool isPointingAnimal = false;
        if (Cam != null && Physics.Raycast(Cam.transform.position, Cam.transform.forward * 500f, out Updatehit, 1000f))
		{
			AnimalBehaviour animalHit = Updatehit.transform.GetComponentInParent<AnimalBehaviour>();
			if (animalHit == null && Updatehit.transform.root != null)
			{
				animalHit = Updatehit.transform.root.GetComponentInChildren<AnimalBehaviour>();
			}

			if (animalHit != null || Updatehit.collider.CompareTag("Head") || Updatehit.transform.CompareTag("AnimalBody") || Updatehit.transform.CompareTag("Lungs") || (Updatehit.transform.gameObject.tag == "HitBox"))
			{
				isPointingAnimal = true;
			}

           if (UIcontrol.Obj != null && UIcontrol.Enablezoom)
			{
				if (animalHit != null)
				{
					animalHit.distance = Vector3.Distance(base.transform.position, animalHit.transform.position);
					UIcontrol.Obj.animalDetailsObj.SetActive(true);
					UIcontrol.Obj.animalNameTxt.text = animalHit._name;
					UIcontrol.Obj.animalDistanceTxt.text = animalHit.distance.ToString("F0") + "m";
				}
                else if (UIcontrol.Obj.animalDetailsObj != null)
				{
					UIcontrol.Obj.animalDetailsObj.SetActive(false);
				}
			}
            else if (UIcontrol.Obj != null && UIcontrol.Obj.animalDetailsObj != null)
			{
				UIcontrol.Obj.animalDetailsObj.SetActive(false);
			}
		}

		// Toggle yellow dot over crosshair/scope center
		if (aimIndicatorDot != null)
		{
			if (isPointingAnimal && !aimIndicatorDot.gameObject.activeSelf)
			{
				aimIndicatorDot.gameObject.SetActive(true);
			}
			else if (!isPointingAnimal && aimIndicatorDot.gameObject.activeSelf)
			{
				aimIndicatorDot.gameObject.SetActive(false);
			}
		}
		if (IsShooting && timeval != 0f)
		{
			timeval += Time.deltaTime;
			if (timeval > Maxtimeval)
			{
				IsShooting = false;
				timeval = 0f;
			}
		}
	}

	private void fire()
	{
        print("FireClicked.....");
        for (int i = 0; i < projectilecount; i++)
		{
			firebullet();
		}
		IsShooting = true;
		timeval = Time.time;
		Maxtimeval = timeval + 1.5f;
	}

	private void AnimalAlert(AnimalBehaviour excludeAnimal = null)
	{
		AnimalBehaviour[] array = Object.FindObjectsOfType(typeof(AnimalBehaviour)) as AnimalBehaviour[];
		AnimalBehaviour[] array2 = array;
		foreach (AnimalBehaviour animalBehaviour in array2)
		{
			Debug.Log("alert me :::::::::::::" + animalBehaviour.isDead + "::: " + animalBehaviour.isTarget);
			if (!animalBehaviour.isDead && (excludeAnimal == null || animalBehaviour != excludeAnimal))
			{
				animalBehaviour.animalAnim = AnimalBehaviour.AnimalAnimations.run;
				animalBehaviour.SetAnimalAnimation();
				animalBehaviour.SetDestinatn();
			}
		}
		firstTimeBulletFire = false;
	}

	// Kya ye shot LAST kill hai? (is kill ke baad level ka target poora ho jayega)
	private bool IsLastTarget(AnimalBehaviour animal)
	{
		if (animal == null || animal.isDead) return false;

		if (GameManager.MODE_Hard)
		{
			// Hard mode: sirf target animal aur sirf 1 target bacha ho
			return animal.isTarget && LevelDetails._instance.remainingTargets <= 1;
		}

		// Easy / AnimalWdNameX: ye kill TotalKills poora kar degi
		return UIcontrol.Noofenemieskilled + 1 >= playercontroller.TotalKills;
	}

	private void firebullet()
	{
		Vector3 forward = base.transform.forward;
		Vector3 up = base.transform.up;
		Vector3 right = base.transform.right;
		Vector3 vector = forward;
		vector += Random.Range(0f - inaccuracy, inaccuracy) * up + Random.Range(0f - inaccuracy, inaccuracy) * right;
		Debug.DrawRay(base.transform.position, vector, Color.red);
		Ray ray = new Ray(base.transform.position, vector);
		AnimalBehaviour hitAnimal = null;
		if (Physics.Raycast(base.transform.position, base.transform.forward, out hit, 1000f))
		{
			MonoBehaviour.print("---- Ray Hit :::: " + hit.transform.name);
			hit.transform.SendMessageUpwards("Damage", damage, SendMessageOptions.DontRequireReceiver);

			// Check if hit target is an animal (Tag, Component, Parent, or Root check)
			hitAnimal = hit.transform.GetComponentInParent<AnimalBehaviour>();
			if (hitAnimal == null && hit.transform.root != null)
			{
				hitAnimal = hit.transform.root.GetComponentInChildren<AnimalBehaviour>();
			}

			// Animal ko bullet lagne par run na hone dein
			if (hitAnimal != null)
			{
				hitAnimal.StopRunningOnHit();
			}

			bool isAnimalHit = (hitAnimal != null 
				|| hit.collider.CompareTag("Head") 
				|| hit.transform.CompareTag("AnimalBody") 
				|| hit.transform.CompareTag("Lungs") 
				|| (hit.transform.gameObject.tag == "HitBox")
				|| hit.collider.gameObject.layer == 10);

			// Prepare damage & impact action
			RaycastHit capturedHit = hit;
			System.Action applyImpact = () =>
			{
				// Spawn Blood Particles immediately on hit point
				GameObject bloodPrefab = BloodPart2 != null ? BloodPart2 : BloodPart;
				if (bloodPrefab != null)
				{
					Vector3 spawnNormal = capturedHit.normal != Vector3.zero ? capturedHit.normal : Vector3.up;
					GameObject bEffect = Object.Instantiate(bloodPrefab, capturedHit.point, Quaternion.FromToRotation(Vector3.up, spawnNormal));
					bEffect.SetActive(true);
				}

				if (capturedHit.collider.tag == "Head" && !LevelDetails._instance.isInfraRedLevel)
				{
					if (hitAnimal != null) hitAnimal.DamageAnimal(hitAnimal.damageValue);
					if (UIcontrol.Obj != null)
					{
						UIcontrol.Obj.helpText.gameObject.SetActive(true);
						UIcontrol.Obj.ShootTextHelp("HeadShot", 2f);
					}
				}
				else if (capturedHit.collider.gameObject.layer == 10)
				{
					capturedHit.transform.SendMessageUpwards("CheckHealth", SendMessageOptions.DontRequireReceiver);
					if (hitAnimal != null) hitAnimal.DamageAnimal(Damagevalue);
					Object.Instantiate(BloodPart2, capturedHit.point, Quaternion.FromToRotation(Vector3.up, capturedHit.normal));
				}
				else if (capturedHit.transform.tag == "HitBox")
				{
					Object.Instantiate(BloodPart2, capturedHit.point, Quaternion.FromToRotation(Vector3.up, capturedHit.normal));
					Finalbullet.Finalcharacterpos = capturedHit.transform.root.position;
					Finalbullet.Finalcampos = base.transform.localPosition;
					Finalbullet.Finalcamrot = base.transform.localEulerAngles;
					if (capturedHit.transform.name == "NeckHead")
					{
						if (_UIcontrolref != null) _UIcontrolref.Headshotobj.SetActive(true);
						capturedHit.transform.name = "NeckHeadshot";
					}
					if (hitAnimal != null) hitAnimal.DamageAnimal(Damagevalue);
				}
				else if (capturedHit.transform.CompareTag("AnimalBody") && !LevelDetails._instance.isInfraRedLevel)
				{
					if (hitAnimal != null) hitAnimal.DamageAnimal(Damagevalue);
					Debug.Log("damage value :" + Damagevalue);
					Object.Instantiate(BloodPart2, capturedHit.point, Quaternion.FromToRotation(Vector3.up, capturedHit.normal));
				}
				else if (capturedHit.transform.CompareTag("Lungs") && LevelDetails._instance.isInfraRedLevel)
				{
					if (hitAnimal != null) hitAnimal.DamageAnimal(Damagevalue);
					Debug.Log("damage value :" + Damagevalue);
					if (UIcontrol.Obj != null) UIcontrol.Obj.ShootTextHelp("Lung Shot", 2f);
					Object.Instantiate(BloodPart2, capturedHit.point, Quaternion.FromToRotation(Vector3.up, capturedHit.normal));
				}
				else if (capturedHit.collider.tag == "Victim")
				{
					Debug.Log("Hit to victim");
					if (VictimBehaviour._instance != null) VictimBehaviour._instance.VictimDead();
					if (UIcontrol.Obj != null) UIcontrol.Obj.ShootTextHelp2("You Killed Victim.", 2f);
				}
				else if (capturedHit.transform.tag == "Untagged")
				{
					if (hitAnimal != null)
					{
						hitAnimal.DamageAnimal(Damagevalue);
						Object.Instantiate(BloodPart2, capturedHit.point, Quaternion.FromToRotation(Vector3.up, capturedHit.normal));
					}
					else
					{
						GameObject gameObject = Poolimpactobjs();
						if (gameObject != null)
						{
							gameObject.SetActive(true);
							gameObject.transform.position = capturedHit.point;
							gameObject.transform.rotation = Quaternion.FromToRotation(Vector3.up, capturedHit.normal);
						}
						GameObject gameObject2 = Poolimpactparticles();
						if (gameObject2 != null)
						{
							gameObject2.SetActive(true);
							gameObject2.transform.position = capturedHit.point;
							gameObject2.transform.rotation = Quaternion.FromToRotation(Vector3.up, capturedHit.normal);
						}
					}
				}
			};

			// Lethal shot: headshot ek goli mein maar deta hai, warna baaki health <= damage
			bool isHeadHit = hit.collider.CompareTag("Head");
			bool isLethalShot = hitAnimal != null && !hitAnimal.isDead &&
								(isHeadHit || hitAnimal.damageValue - Damagevalue <= 0f);
			bool isLastKill = IsLastTarget(hitAnimal);
			bool slowmoBusy = BulletSlowmoFollowCam.Instance != null && BulletSlowmoFollowCam.Instance.IsActive();

			Debug.Log("[SLOWMO] animalHit=" + isAnimalHit + " lethal=" + isLethalShot +
					  " last=" + isLastKill + " busy=" + slowmoBusy +
					  " hard=" + GameManager.MODE_Hard +
					  " killed=" + UIcontrol.Noofenemieskilled + "/" + playercontroller.TotalKills);

			// Sirf LAST KILL par Slow Motion
			if (isAnimalHit && isLethalShot && isLastKill && !slowmoBusy)
			{
				if (BulletSlowmoFollowCam.Instance == null)
				{
					GameObject bCamObj = new GameObject("BulletSlowmoFollowCam_Manager");
					BulletSlowmoFollowCam.Instance = bCamObj.AddComponent<BulletSlowmoFollowCam>();
				}

				Debug.Log("LAST KILL - Slow Motion!");

				BulletSlowmoFollowCam.Instance.LaunchBullet(
					base.transform.position,
					capturedHit.point,
					applyImpact,
					hitAnimal != null ? hitAnimal.transform : null
				);
			}
			else
			{
				applyImpact();
			}
		}

		print("BulletFired...");
		if (GameManager.MODE_Hard)
		{
			if (firstTimeBulletFire && LevelDetails._instance.canAlertAnimal)
			{
				AnimalAlert(hitAnimal);
			}
		}
		else
		{
			AnimalAlert(hitAnimal);
		}
	}

	private GameObject Poolimpactobjs()
	{
		for (int i = 0; i < Allbulletshots.Count; i++)
		{
			if (!Allbulletshots[i].activeSelf)
			{
				return Allbulletshots[i];
			}
		}
		return null;
	}

	private GameObject Poolimpactparticles()
	{
		for (int i = 0; i < Allbulletimpactparticle.Count; i++)
		{
			if (!Allbulletimpactparticle[i].activeSelf)
			{
				return Allbulletimpactparticle[i];
			}
		}
		return null;
	}

	private void BulletFired(Vector3 posToMove)
	{
		genericShooter.myScript.CreateBullet(posToMove);
	}

	private bool ShowBulletFire(RaycastHit _hit)
	{
		if (_hit.transform.tag.Contains("_Head"))
		{
			mi_HeadShots++;
			return true;
		}
		if (_hit.transform.name.Contains("_Brain"))
		{
			mi_BrainShots++;
			return true;
		}
		if (_hit.transform.name.Contains("Heart"))
		{
			mi_HeartShots++;
			return true;
		}
		if (_hit.transform.name.Contains("Lungs"))
		{
			mi_LungShots++;
			return true;
		}
		return false;
	}
}
