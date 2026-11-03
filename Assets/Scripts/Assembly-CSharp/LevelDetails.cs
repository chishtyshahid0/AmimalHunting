using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LevelDetails : MonoBehaviour
{
    [Serializable]
    public class WaveInfo
    {
        public string ms_Name;

        public GameObject animalObj;

        public List<AnimalBehaviour> animalsList;
    }

    public WaveInfo[] waveInfo;

    public int totalTaregts;

    public int remainingTargets;

    public int currentWaveID;

    public static LevelDetails _instance;

    public bool dontShowLevelCamera;

    public Camera levelCamera;

    public string levelDescription;

    public List<AnimalBehaviour> allTargetAnimals;

    private UIcontrol _UIcontrolref;

    public bool isInfraRedLevel;

    public bool isTimeBasedLevel;

    public bool isRunningLoopLevel;

    public bool isTriggeredEnableLevel;

    public bool isSaveVictimLevel;

    public int timeToComplete;

    private string timerFormatted;

    public Transform startPoint;

    [Header("Controlls setup")]
    public bool isJoyStickEnable;

    public bool isArrowsEnable;

    [HideInInspector]
    public bool canAlertAnimal = true;

    private Text wavehelptext;

    private GameObject wavehelpobj;

    public string waveHelpStr;

    [HideInInspector]
    public bool startRunning;

    private int runIndex;

    [HideInInspector]
    public bool startTimer;

    [HideInInspector]
    public bool timeUp;

    private void Start()
    {
        if (UIcontrol.Obj != null)
        {
            _UIcontrolref = UIcontrol.Obj;
        }
        if (GameManager.MODE_Hard)
        {
            if (isRunningLoopLevel)
            {
                Invoke("StartRunAnimation", 1f);
            }
            else if (!isTimeBasedLevel)
            {
                UIcontrol.Obj.timerObj.gameObject.SetActive(false);
            }
            if (dontShowLevelCamera)
            {
                UIcontrol.Obj.StartButtonClick();
            }
            if (isJoyStickEnable)
            {
            }
            wavehelptext = UIcontrol.Obj.waveHelpTxt;
            wavehelpobj = UIcontrol.Obj.waveHelpObj;
            LevelManager._instance.Camera = levelCamera.gameObject;
        }
    }

    private void Awake()
    {
        _instance = this;
        if (GameManager.MODE_Hard)
        {
            for (int i = 0; i < waveInfo.Length; i++)
            {
                AnimalBehaviour[] componentsInChildren = waveInfo[i].animalObj.GetComponentsInChildren<AnimalBehaviour>();
                AnimalBehaviour[] array = componentsInChildren;
                foreach (AnimalBehaviour animalBehaviour in array)
                {
                    if (animalBehaviour.isTarget)
                    {
                        waveInfo[i].animalsList.Add(animalBehaviour);
                        allTargetAnimals.Add(animalBehaviour);
                    }
                }
            }
            if (!isSaveVictimLevel)
            {
                totalTaregts = allTargetAnimals.Count;
            }
            remainingTargets = totalTaregts;

            //if (startPoint.GetComponent<MeshRenderer>()!=null)
            startPoint.GetComponent<MeshRenderer>().enabled = false;
        }
    }

    public void StartCountDown()
    {
        UIcontrol.Obj.timerObj.gameObject.SetActive(true);
        startTimer = true;
        StartCoroutine(CountDown());
    }

    public void RemoveCurrentAnimalFromList()
    {
        if (GameManager.MODE_Hard)
        {
            if (isSaveVictimLevel)
            {
                return;
            }
            waveInfo[currentWaveID].animalsList.RemoveAt(0);
            remainingTargets--;
            _UIcontrolref.SetTarget();
            //UIcontrol.Obj.SetTarget();
            Debug.Log("totaltargets" + totalTaregts);
            if (waveInfo[currentWaveID].animalsList.Count <= 0)
            {
                Debug.Log("mi current wave index : " + currentWaveID + " waveinfolength :" + waveInfo.Length);
                if (currentWaveID < waveInfo.Length - 1)
                {
                    canAlertAnimal = false;
                    currentWaveID++;
                    Invoke("ActivateNextWave", 5f);
                }
                else
                {
                    Debug.Log("no more waves... show levelcomplete;;;");
                    _UIcontrolref.Invoke("ShowLevelComplete", 3f);
                }
            }
        }
        else
        {
            if (UIcontrol.Noofenemieskilled == playercontroller.TotalKills)
                _UIcontrolref.Invoke("ShowLevelComplete", 3f);

            _UIcontrolref.SetTarget();
        }
    }

    private void ActivateNextWave()
    {
        waveInfo[currentWaveID].animalObj.SetActive(true);
        raycastfire._instance.firstTimeBulletFire = true;
        DisableCurrentWaveAnimals();
    }

    private void DisableCurrentWaveAnimals()
    {
        if (isTriggeredEnableLevel)
        {
            wavehelpobj.gameObject.SetActive(true);
            wavehelptext.text = waveHelpStr;
            UIcontrol.Obj.arrowsObj.SetActive(false);
            UIcontrol.Obj.joystick.SetActive(true);
            for (int i = 0; i < waveInfo[currentWaveID].animalsList.Count; i++)
            {
                waveInfo[currentWaveID].animalsList[i].gameObject.SetActive(false);
            }
            Camera.main.transform.localPosition = new Vector3(0f, Camera.main.transform.localPosition.y, Camera.main.transform.localPosition.z);
        }
    }

    public void EnableCurrentWaveAnimals()
    {
        if (isTriggeredEnableLevel)
        {
            UIcontrol.Obj.arrowsObj.SetActive(true);
            UIcontrol.Obj.joystick.SetActive(false);
            //print("was Turning Joystick Off");
            canAlertAnimal = true;
            for (int i = 0; i < waveInfo[currentWaveID].animalsList.Count; i++)
            {
                waveInfo[currentWaveID].animalsList[i].gameObject.SetActive(true);
            }
        }
    }

    public void StartRunAnimation()
    {
        if (runIndex >= allTargetAnimals.Count)
        {
            runIndex = 0;
        }
        runIndex++;
        for (int i = 0; i < allTargetAnimals.Count; i++)
        {
            if (allTargetAnimals[runIndex - 1].gameObject.activeInHierarchy)
            {
                allTargetAnimals[runIndex - 1].runNow = true;
                allTargetAnimals[runIndex - 1].animalAnim = AnimalBehaviour.AnimalAnimations.run;
                allTargetAnimals[runIndex - 1].SetAnimalAnimation();
            }
        }
        Invoke("StartRunAnimation", 5f);
    }

    private IEnumerator CountDown()
    {
        while (startTimer)
        {
            yield return new WaitForSeconds(1f);
            if (timeToComplete <= 0 && !GameManager.MODE_Hard)
            {
                timeUp = true;
                if (!UIcontrol.Obj.isLevelFail)
                {
                    Debug.Log("Time UP");
                    UIcontrol.Obj.Invoke("ShowLevelFail", 2f);
                    startTimer = false;
                    UIcontrol.Obj.ShootTextHelp("Time Up !!!", 3f);
                    AnimalBehaviour[] array = UnityEngine.Object.FindObjectsOfType(typeof(AnimalBehaviour)) as AnimalBehaviour[];
                    AnimalBehaviour[] array2 = array;
                    foreach (AnimalBehaviour animalBehaviour in array2)
                    {
                        animalBehaviour.myAgent.speed = 0f;
                        animalBehaviour.animalAnim = AnimalBehaviour.AnimalAnimations.dead;
                    }
                    //AiAttack aiAttack = UnityEngine.Object.FindObjectOfType(typeof(AiAttack)) as AiAttack;
                    //aiAttack.enabled = false;
                }
            }
            if (timeToComplete <= 0 && remainingTargets > 1)
            {
                timeUp = true;
                if (isSaveVictimLevel)
                {
                    UIcontrol.Obj.Invoke("ShowLevelComplete", 2f);
                    startTimer = false;
                    UIcontrol.Obj.ShootTextHelp("Congratulations!! You Saved Victim !", 3f);
                }
                else if (!UIcontrol.Obj.isLevelFail)
                {
                    Debug.Log("Time UP");
                    UIcontrol.Obj.Invoke("ShowLevelFail", 2f);
                    startTimer = false;
                    UIcontrol.Obj.ShootTextHelp("Time Up !!!", 3f);
                    AnimalBehaviour[] array = UnityEngine.Object.FindObjectsOfType(typeof(AnimalBehaviour)) as AnimalBehaviour[];
                    AnimalBehaviour[] array2 = array;
                    foreach (AnimalBehaviour animalBehaviour in array2)
                    {
                        animalBehaviour.myAgent.speed = 0f;
                        animalBehaviour.animalAnim = AnimalBehaviour.AnimalAnimations.dead;
                    }
                    AiAttack aiAttack = UnityEngine.Object.FindObjectOfType(typeof(AiAttack)) as AiAttack;
                    aiAttack.enabled = false;
                }
            }
            else
            {
                timeToComplete--;
                TimeSpan timeSpan = TimeSpan.FromSeconds(timeToComplete);
                timerFormatted = $"{timeSpan.Minutes:0}:{timeSpan.Seconds:00}";
                UIcontrol.Obj.timeerText.text = timerFormatted;
            }
        }
    }


}
