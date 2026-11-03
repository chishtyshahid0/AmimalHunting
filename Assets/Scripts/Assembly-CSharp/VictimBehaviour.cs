using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class VictimBehaviour : MonoBehaviour
{
	public static VictimBehaviour _instance;

	public Image filler;

	public Text helpText;

	public GameObject victim;

	private Animator victimAnim;

	private float timeOfHelp = 2f;

	private bool isDead;

	[HideInInspector]
	public bool isAttacking;

	private void Awake()
	{
		_instance = this;
		victimAnim = victim.GetComponent<Animator>();
	}

	private void Start()
	{
		StartCoroutine(ShowHelpMsg(1f));
		victimAnim.SetTrigger("Idle");
	}

	private IEnumerator ShowHelpMsg(float time)
	{
		while (true)
		{
			yield return new WaitForSeconds(timeOfHelp);
			helpText.text = "Save deer.";
			yield return new WaitForSeconds(timeOfHelp);
			helpText.text = "Help...";
			yield return new WaitForSeconds(timeOfHelp);
			helpText.text = "Save.";
		}
	}

	private void Update()
	{
		if (!UIcontrol.Obj.isLevelComplete && !UIcontrol.Obj.isLevelFail && !isDead)
		{
			if (isAttacking)
			{
				filler.fillAmount -= 0.05f * Time.deltaTime;
			}
			if (filler.fillAmount <= 0f)
			{
				isDead = true;
				Debug.Log("victim dead ");
				UIcontrol.Obj.ShootTextHelp2("Victim Dead", 2f);
				VictimDead();
			}
		}
	}

	public void VictimDead()
	{
		victimAnim.SetTrigger("Dead");
		UIcontrol.Obj.Invoke("ShowLevelFail", 2.5f);
	}

	private void OnTriggerEnter(Collider col)
	{
		if (col.CompareTag("AnimalBody"))
		{
			Debug.Log("triggered : " + col.gameObject.name + " __parent ___" + col.GetComponentInParent<AnimalBehaviour>());
			AnimalBehaviour componentInParent = col.GetComponentInParent<AnimalBehaviour>();
			if (!componentInParent.isDead)
			{
				isAttacking = true;
				componentInParent.animalAnim = AnimalBehaviour.AnimalAnimations.attack;
				componentInParent.SetAnimalAnimation();
				componentInParent.myAgent.speed = 0f;
			}
		}
	}

	private void OnTriggerExit(Collider col)
	{
		isAttacking = false;
	}
}
