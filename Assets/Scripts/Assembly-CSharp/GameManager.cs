using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
	public static GameManager _instance;
    public static bool ENV_Jungle, ENV_Snow, ENV_Desert, MODE_Easy, MODE_Hard, MODE_AnimalWdNameX;

    public GameObject Environment,Terrain;

    public string[] EffectName;
    public GameObject Effect;


    public Transform[] EscapePosition,PlayerPosition,EnemySpwanPos;

    public GameObject[] CameraAnimation;

    private void Awake()
	{
        Time.timeScale = 1;
		_instance = this;
        MODE_Easy = true;
        ENV_Jungle = true;
        if (MODE_Hard)
        {
            if (SceneManager.GetActiveScene().name == "Ingame_Forest")
            {
                ENV_Jungle = true;
            }
            else if (SceneManager.GetActiveScene().name == "Ingame_Snow")
            {
                ENV_Snow = true;
            }
            else if (SceneManager.GetActiveScene().name == "Ingame_Desert")
            {
                ENV_Desert = true;
            }
        }
    }
    private void Start()
	{
        EnvironmentSetting();

    }

    public void EnvironmentSetting()
    {
        if (ENV_Jungle)
        {
            //Environment = Instantiate(Resources.Load("Env/Environment (1)")) as GameObject;
            RenderSettings.fog = true;
            RenderSettings.fogDensity = 0.005f;
            RenderSettings.fogColor = new Color32(232, 249, 255, 255);
        }
        else if (ENV_Desert)
        {
            Environment = Instantiate(Resources.Load("Env/Environment (0)")) as GameObject;
            

            RenderSettings.fog = true;
            RenderSettings.fogDensity = 0.005f;
            RenderSettings.fogColor = new Color32(243, 210, 166, 255);

        }
        else if (ENV_Snow)
        {
            //Environment = Instantiate(Resources.Load("Env/Environment (2)")) as GameObject;

            //int Rand = Random.Range(0, Effect.Length);
            //var Loader = Resources.Load("CameraFXEffects/" + EffectnAME[Rand]) as GameObject;
            //Effect[Rand] = (GameObject)Instantiate(Loader, Player.transform);
            //Loader = null;
            //Effect[Rand].SetActive(true);


            RenderSettings.fog = true;
            RenderSettings.fogDensity = 0.013f;
            RenderSettings.fogColor = new Color32(152, 152, 152, 255);
        }
    }
}
