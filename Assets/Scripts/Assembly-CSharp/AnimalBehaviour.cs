using UnityEngine;
using UnityEngine.AI;

public class AnimalBehaviour : MonoBehaviour
{
	public enum AnimalAnimations
	{
		idle,
		walk,
		jump,
		run,
		dead,
		eating,
		idleLeftLeg,
		attack,
		directAttack
	}

	public enum BehaviourEnum
	{
		escape,
		attack,
		none
	}

	public AnimalAnimations animalAnim;

	public BehaviourEnum behaviourenum;

	[HideInInspector]
	public NavMeshAgent myAgent;

	private float agentSpeed;

	public string _name = "Shiras moose";

	public float distance;

	public float damageValue = 50f;

	public float damageToPlayer = 50f;

	[HideInInspector]
	public bool isDead;

	public Transform myPlayer;

	public Transform escapePosition;

	private Animator myAnimator;

	public bool isTarget;

	public GameObject lungs;

	private Renderer render;

	public Collider[] allColliders;

	public float runSpeed = 10f;

	public float walkSpeed = 4f;

	private Shader animalShader;

	private bool checkAnimalBehaviour;

	public float remainigDistance;

	public int attackToPlayerInDistance = 10;

	private bool isAttacking;

	private float roamRadious = 50f;

	public bool runNow;

	private Vector3 startPos;

	private void Start()
	{
		myAgent = GetComponent<NavMeshAgent>();
		agentSpeed = GetComponent<NavMeshAgent>().speed;
		Debug.Log("agent speed : " + agentSpeed);
		myPlayer = Object.FindObjectOfType<playercontroller>().transform;

        //Managing Escape Position of Animal Generically... haha
        if (escapePosition == null && !GameManager.MODE_Hard)
        {
            int Rand = Random.Range(0, GameManager._instance.EscapePosition.Length);
            escapePosition = GameManager._instance.EscapePosition[Rand];
        }

		if (GetComponent<Animator>())
		{
			myAnimator = GetComponent<Animator>();
			SetAnimalAnimation();
		}
		render = GetComponentInChildren<SkinnedMeshRenderer>().GetComponent<Renderer>();
		if (lungs != null && lungs.activeInHierarchy)
		{
			lungs.SetActive(false);
		}
		allColliders = base.gameObject.GetComponentsInChildren<Collider>();
        if (LevelDetails._instance != null)
        {
            if (LevelDetails._instance.isInfraRedLevel)
            {
                Collider[] array = allColliders;
                foreach (Collider collider in array)
                {
                    collider.enabled = false;
                }
            }
        }
		startPos = base.transform.position;
		animalShader = render.material.shader;
	}

	public void ChangeToInfreredMode()
	{
		Camera.main.transform.GetComponent<CameraFilterPack_Colors_NewPosterize>().enabled = true;
		render.material.shader = Shader.Find("Mobile/Particles/Additive");
		Collider[] array = allColliders;
		foreach (Collider collider in array)
		{
			collider.enabled = false;
		}
		lungs.SetActive(true);
	}

	public void ChangeToNormalMode()
	{
		Camera.main.transform.GetComponent<CameraFilterPack_Colors_NewPosterize>().enabled = false;
		render.material.shader = animalShader;
		Collider[] array = allColliders;
		foreach (Collider collider in array)
		{
			collider.enabled = true;
		}
		lungs.SetActive(false);
		UIcontrol.Obj.watchVideoFillerBtn.SetActive(true);
	}

	public void SetAnimalAnimation()
	{
		if (animalAnim == AnimalAnimations.idle)
		{
			myAnimator.SetTrigger("Idle");
		}
		else if (animalAnim == AnimalAnimations.walk)
		{
			myAnimator.SetTrigger("Walk");
			myAgent.speed = walkSpeed;
			RoamBehaviour();
		}
		else if (animalAnim == AnimalAnimations.jump)
		{
			myAnimator.SetTrigger("Jump");
		}
		else if (animalAnim == AnimalAnimations.run || animalAnim == AnimalAnimations.directAttack)
		{
			if (isDead) return;
			myAnimator.SetTrigger("Run");
			myAgent.speed = runSpeed;
            print("Animal Behavior on BulletFired...");
            if (GameManager.MODE_Hard)
            {
                if (LevelDetails._instance.isRunningLoopLevel)
                {
                    Invoke("RunBehaviour", 1f);
                }
                if (!LevelDetails._instance.isRunningLoopLevel && !isTarget)
                {
                    Invoke("RandomRun", 0.5f);
                }
                else
                {
                    Invoke("SetDestinatn", 2f);
                }
            }
            else
            {
                Invoke("SetDestinatn", 2f);
            }
            
		}
		else if (animalAnim == AnimalAnimations.dead)
		{
			myAnimator.SetTrigger("Dead");
			Debug.Log(" animal dead animation ______________");
		}
		else if (animalAnim == AnimalAnimations.eating)
		{
			myAnimator.SetTrigger("Eat");
		}
		else if (animalAnim == AnimalAnimations.idleLeftLeg)
		{
			myAnimator.SetTrigger("IdleLeftLeg");
		}
		else if (animalAnim == AnimalAnimations.attack && !isDead)
		{
			myAnimator.SetTrigger("Attack");
			Debug.Log("attack anim playing::;");
		}
	}

	public void SetDestinatn()
	{
		if (isDead || animalAnim != AnimalAnimations.run)
		{
			return;
		}
		checkAnimalBehaviour = true;
	}

	public void StopRunningOnHit()
	{
		CancelInvoke("RunBehaviour");
		CancelInvoke("RandomRun");
		CancelInvoke("SetDestinatn");
		runNow = false;
		checkAnimalBehaviour = false;
		if (animalAnim == AnimalAnimations.run)
		{
			animalAnim = AnimalAnimations.idle;
			if (myAnimator != null)
			{
				myAnimator.SetTrigger("Idle");
			}
		}
		if (myAgent != null && myAgent.isOnNavMesh)
		{
			myAgent.isStopped = true;
			myAgent.velocity = Vector3.zero;
			myAgent.ResetPath();
			myAgent.speed = 0f;
		}
		runSpeed = 0f;
	}

	private void Update()
	{
		if (isDead)
		{
			if (myAgent != null && myAgent.isOnNavMesh && !myAgent.isStopped)
			{
				myAgent.isStopped = true;
				myAgent.velocity = Vector3.zero;
			}
			return;
		}

		remainigDistance = myAgent.remainingDistance;
		if (LevelDetails._instance != null && checkAnimalBehaviour && !LevelDetails._instance.isSaveVictimLevel)
		{
			if (behaviourenum == BehaviourEnum.attack || animalAnim == AnimalAnimations.directAttack)
			{
				myAgent.SetDestination(myPlayer.transform.GetChild(0).position);
				Invoke("CheckDistance_Attack", 0.5f);
				CancelInvoke("RoamBehaviour");
			}
			else if (behaviourenum == BehaviourEnum.escape && animalAnim == AnimalAnimations.run)
			{
				Invoke("CheckDistance_Escape", 0.5f); 
                myAgent.SetDestination(escapePosition.position);
				CancelInvoke("RoamBehaviour");
			}
		}
		if (VictimBehaviour._instance != null && isDead)
		{
			VictimBehaviour._instance.isAttacking = false;
		}
	}

	private void Dead()
	{
		animalAnim = AnimalAnimations.dead;
		SetAnimalAnimation();
		isDead = true;
	}

	private void CheckDistance_Escape()
	{
		if (!playercontroller.Obj.isAnimalEscaped)
		{
			AnimalEscaped();
		}
	}
    bool called = false;
	private void AnimalEscaped()
	{
        if (isTarget && base.gameObject.activeInHierarchy && myAgent.remainingDistance <= 5f && !isDead && !UIcontrol.Obj.isLevelFail)
        {
            if (GameManager.MODE_Easy || GameManager.MODE_AnimalWdNameX)
            {
                int Rand = Random.Range(0, GameManager._instance.EscapePosition.Length);
                escapePosition = GameManager._instance.EscapePosition[Rand];
                if (!called)
                {
                    Invoke("StopRunBehaviour", 1f); called = true;
                }
            }
            else
            {
                Debug.Log(base.gameObject.name + " __escaped ....show LF:__Distance:" + myAgent.remainingDistance);
                UIcontrol.Obj.ShootTextHelp(" Animal Escaped. ", 2f);
                UIcontrol.Obj.Invoke("ShowLevelFail", 2.1f);
                checkAnimalBehaviour = false;
                playercontroller.Obj.isAnimalEscaped = true;
            }
		}
	}
    void StopRunBehaviour()
    {
        called = false; checkAnimalBehaviour = false;
        animalAnim = AnimalAnimations.walk;
        SetAnimalAnimation();
    }
	private void CheckDistance_Attack()
	{
		if (base.gameObject.activeInHierarchy && myAgent.remainingDistance <= (float)attackToPlayerInDistance && !isAttacking && !UIcontrol.Obj.isLevelFail && !UIcontrol.Obj.isLevelComplete)
		{
            //Debug.LogError("attacking :" + base.gameObject.name + "__Distance__ : " + myAgent.remainingDistance);
            Debug.Log("attacking :" + base.gameObject.name + "__Distance__ : " + myAgent.remainingDistance);
            myAgent.speed = 0f;
			runSpeed = 0f;
			isAttacking = true;
			if (isAttacking)
			{
				AttackAnimation();
			}
		}
		else if (base.gameObject.activeInHierarchy && myAgent.remainingDistance >= (float)attackToPlayerInDistance && isAttacking && !isDead)
		{
			Debug.Log("else ::::: ");
			isAttacking = false;
			animalAnim = AnimalAnimations.run;
			SetAnimalAnimation();
			myAgent.speed = agentSpeed;
		}
		else if (isDead)
		{
			CancelInvoke("DamagePlayer");
		}
	}

	private void AttackAnimation()
	{
		Debug.Log("attack animation :");
		animalAnim = AnimalAnimations.attack;
		SetAnimalAnimation();
		base.transform.LookAt(Camera.main.transform);
		InvokeRepeating("DamagePlayer", 1f, 1f);
	}

	private void RoamBehaviour()
	{
		if (base.gameObject.activeInHierarchy)
		{
			if (myAgent.remainingDistance < 5f)
			{
				myAgent.speed = walkSpeed;
				Vector3 sourcePosition = Random.insideUnitSphere * roamRadious;
				sourcePosition += base.transform.position;
				NavMesh.SamplePosition(sourcePosition, out var hit, roamRadious, 1);
				Vector3 position = hit.position;
				myAgent.SetDestination(position);
			}
			distance = Vector3.Distance(base.transform.position, myPlayer.transform.position);
			if (distance <= 15f)
			{
				Invoke("RoamBehaviour", 0f);
			}
			else
			{
				Invoke("RoamBehaviour", 1f);
			}
		}
	}

	private void RunBehaviour()
	{
		if (!base.gameObject.activeInHierarchy || !runNow)
		{
			return;
		}
		if (isDead)
		{
			CancelInvoke("RunBehaviour");
			Debug.LogError("Cancle invoke");
			return;
		}
		myAgent.speed = runSpeed;
		myAgent.SetDestination(escapePosition.position);
		if (myAgent.remainingDistance <= 7f)
		{
			base.transform.position = startPos;
		}
		Invoke("RunBehaviour", 1f);
	}

	private void RandomRun()
	{
		if (base.gameObject.activeInHierarchy)
		{
			myAgent.speed = runSpeed;
			Vector3 sourcePosition = Random.insideUnitSphere * 50f;
			sourcePosition += base.transform.position;
			NavMesh.SamplePosition(sourcePosition, out var hit, 100f, 1);
			Vector3 position = hit.position;
			myAgent.SetDestination(position);
			Invoke("RandomRun", 1f);
		}
	}

	public void DamageAnimal(float damageVal)
	{
		if (isDead)
		{
			return;
		}

		// Bullet lagne par animal run na ho - stop running immediately
		StopRunningOnHit();

		damageValue -= damageVal;
		Debug.Log("apply damage to animal : " + damageValue);
		if (damageValue <= 0f)
		{
			isDead = true;
			checkAnimalBehaviour = false;
			CancelInvoke();
			if (myAgent != null && myAgent.isOnNavMesh)
			{
				myAgent.isStopped = true;
				myAgent.velocity = Vector3.zero;
				myAgent.ResetPath();
			}
			myAgent.speed = 0f;
			runSpeed = 0f;
			Debug.Log("animal Dead::__Speed :" + myAgent.speed);
			animalAnim = AnimalAnimations.dead;
			SetAnimalAnimation();

			// Animal marte hi foran iska red dot indicator remove karo
			AnimalTargetIndicatorManager.OnAnimalDied(this);

            if(GameManager.MODE_Easy || GameManager.MODE_AnimalWdNameX)
                UIcontrol.Noofenemieskilled++;
            if (isTarget)
			{
				LevelDetails._instance.RemoveCurrentAnimalFromList();
			}
			Invoke("RemoveThisObj", 7f);
		}
		else
		{
			// Agar bullet lagne ke baad bhi animal zinda rahe to run na kare
			animalAnim = AnimalAnimations.idle;
			if (myAnimator != null)
			{
				myAnimator.SetTrigger("Idle");
			}
		}
	}

	private void RemoveThisObj()
	{
		base.gameObject.SetActive(false);
	}

	private void DamagePlayer()
	{
		playercontroller.Obj.DamagePlayer(damageToPlayer);
	}

	private void OnTriggerEnter(Collider col)
	{
		if (col.gameObject.CompareTag("EscapePos"))
		{
			Debug.Log("Show level fail :");
		}
	}
}
