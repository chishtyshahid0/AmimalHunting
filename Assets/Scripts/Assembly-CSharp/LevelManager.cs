using System.Collections.Generic;
using UnityEngine;

public class LevelManager : MonoBehaviour
{
	public static LevelManager _instance;
    public int TestingIndex;
    public LevelDetails ScriptLevelDetails;
    [HideInInspector]
    public int[] isallocated;//enemy position check
    public GameObject[] Animals;
    public string[] allLevels, EnemyName;
    public int[] TargetCount,Total_InGameAnimals,TimeCount;
    public GameObject Camera,LevelPrefab;
    [HideInInspector]
    public int currentLevel, Total_TargetCount;
    private void Awake()
	{
		_instance = this;
        currentLevel = LevelSelection.levelNumber - 1;
        if (GameManager.MODE_Hard)
        {
            if (playercontroller.cameFromMenu)
            {
                TestingIndex = currentLevel;
                var Loader = Resources.Load("LevelPrefabs/" + allLevels[currentLevel]) as GameObject;
                LevelPrefab = (GameObject)Instantiate(Loader);
                Loader = null;
            }
            else
            {
                var Loader = Resources.Load("LevelPrefabs/" + allLevels[TestingIndex]) as GameObject;
                LevelPrefab = (GameObject)Instantiate(Loader);
                Loader = null;
            }
        }

    }

	private void Start()
    {
        if (GameManager.MODE_Easy || GameManager.MODE_AnimalWdNameX)
        {
            ScriptLevelDetails.gameObject.SetActive(true);
            int Index = Random.Range(0, GameManager._instance.CameraAnimation.Length);
            Camera = GameManager._instance.CameraAnimation[Index];
            Camera.SetActive(true);
            if (playercontroller.cameFromMenu)
            {
                TestingIndex = currentLevel;
                Total_TargetCount = Total_InGameAnimals[currentLevel];
                //isallocated = new int[Total_TargetCount];
                Target_Instantiater();
            }
            else
            {
                Total_TargetCount = Total_InGameAnimals[TestingIndex];
                //isallocated = new int[Total_TargetCount];
                Target_Instantiater();
            }
        }
    }
    public void Target_Instantiater()
    {
        if (Total_TargetCount <= 0)
            return;
        Animals = new GameObject[Total_TargetCount];

        for (int k = 0; k < Total_TargetCount; k++)
        {
            EnemyGenerator(k);
        }
    }
    public void EnemyGenerator(int animalCount)
    {
        if (TestingIndex > 14) return;

        // ? Player ki current position lo
        Vector3 playerPos = playercontroller.Obj.transform.position;

        // ? Minimum aur maximum distance (Inspector se tunable)
        float minDistance = 10f;   // 10m se door
        float maxDistance = 35f;   // 35m ke andar

        // ? Player ke aas paas valid spawn points dhundho
        List<int> validSpots = new List<int>();

        for (int i = 0; i < GameManager._instance.EnemySpwanPos.Length; i++)
        {
            if (isallocated[i] == 1) continue;   // Already used

            float dist = Vector3.Distance(
                GameManager._instance.EnemySpwanPos[i].position,
                playerPos
            );

            // Sirf wo spots jo player ke paas hain
            if (dist >= minDistance && dist <= maxDistance)
            {
                validSpots.Add(i);
            }
        }

        // ? Fallback: Agar player ke paas koi spot nahi mila
        if (validSpots.Count == 0)
        {
            // Sabse paas wala spot dhundho
            int nearestIndex = -1;
            float nearestDist = float.MaxValue;

            for (int i = 0; i < GameManager._instance.EnemySpwanPos.Length; i++)
            {
                if (isallocated[i] == 1) continue;

                float dist = Vector3.Distance(
                    GameManager._instance.EnemySpwanPos[i].position,
                    playerPos
                );

                if (dist < nearestDist)
                {
                    nearestDist = dist;
                    nearestIndex = i;
                }
            }

            if (nearestIndex >= 0)
            {
                validSpots.Add(nearestIndex);
            }
            else
            {
                Debug.LogWarning("Koi spawn point available nahi!");
                return;
            }
        }

        // ? Random valid spot pick karo
        int TempIndex = validSpots[Random.Range(0, validSpots.Count)];
        isallocated[TempIndex] = 1;

        // ? Animal load karo
        GameObject animalPrefab;
        if (GameManager.MODE_AnimalWdNameX)
        {
            animalPrefab = Resources.Load("Enemies/" + GameEnum.AnimalName) as GameObject;
        }
        else
        {
            animalPrefab = Resources.Load("Enemies/" + EnemyName[TestingIndex]) as GameObject;
        }

        // ? Spawn karo
        Animals[animalCount] = Instantiate(
            animalPrefab,
            GameManager._instance.EnemySpwanPos[TempIndex].transform.position,
            GameManager._instance.EnemySpwanPos[TempIndex].transform.rotation
        );

        // ? Debug: Verify distance
        float finalDist = Vector3.Distance(
            playerPos,
            GameManager._instance.EnemySpwanPos[TempIndex].position
        );
        Debug.Log("Animal spawned at " + finalDist.ToString("F1") + "m from player");
    }
}
//Levels Reminder JUNGLE   [1-2-5-9-12-14]
//Levels Reminder Snow     [3-6-7-11-15]
//Levels Reminder Desert   [4-8-10-13]