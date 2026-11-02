using UnityEngine;
using UnityEngine.AI;

public class AiAttack : MonoBehaviour
{
	public GameObject aiSpawnPoint;

	public AnimalBehaviour aiAnimal;

	public float spawnDelay = 5f;

	public VictimBehaviour victim;

	private NavMeshAgent myAgent;

	private AnimalBehaviour instantiatedAi;

	private bool attack;

	private void Awake()
	{
	}

	private void Start()
	{
	}

	public void SpawnAi()
	{
		instantiatedAi = Object.Instantiate(aiAnimal, aiSpawnPoint.transform.position, Quaternion.identity);
		myAgent = instantiatedAi.GetComponent<NavMeshAgent>();
		Debug.LogError("spawned ai name : " + instantiatedAi.gameObject.name);
		if (LevelDetails._instance.isSaveVictimLevel)
		{
			victim = Object.FindObjectOfType(typeof(VictimBehaviour)) as VictimBehaviour;
			myAgent.SetDestination(victim.transform.position);
			instantiatedAi.behaviourenum = AnimalBehaviour.BehaviourEnum.attack;
			instantiatedAi.animalAnim = AnimalBehaviour.AnimalAnimations.run;
			instantiatedAi.isTarget = true;
		}
		else
		{
			if (instantiatedAi.isTarget)
			{
				instantiatedAi.isTarget = false;
			}
			instantiatedAi.behaviourenum = AnimalBehaviour.BehaviourEnum.attack;
			instantiatedAi.animalAnim = AnimalBehaviour.AnimalAnimations.directAttack;
			Debug.Log("anim : ; ; ;_______________________");
			instantiatedAi.SetDestinatn();
		}
		Invoke("SpawnAi", spawnDelay);
	}

	private void LoopSpawn()
	{
		instantiatedAi = Object.Instantiate(aiAnimal, aiSpawnPoint.transform.position, Quaternion.identity);
		Invoke("LoopSpawn", spawnDelay);
	}

	private void AttackToVictim()
	{
		instantiatedAi.animalAnim = AnimalBehaviour.AnimalAnimations.attack;
		instantiatedAi.SetAnimalAnimation();
		attack = true;
	}

	
}
