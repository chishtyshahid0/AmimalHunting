using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
public class GameSettingsManager : MonoBehaviour
{
    public static GameSettingsManager instance;
    public static bool HighQualityProps = false;
    public string[] DirectLight, Rocks, Trees;/////
    int  quality_Value;
    GameObject Env;
    private void Awake()
    {
        HighQualityProps = false;
        instance = this;
    }
    private void Start()
    {
        if (PlayerPrefs.GetInt("Quality", 3) == 0)
        {
            SetQualityVeryLow();
        }
        else if (PlayerPrefs.GetInt("Quality", 3) == 1)
        {
            SetQualityLow();
        }
        else if (PlayerPrefs.GetInt("Quality", 3) == 2)
        {
            SetQualityMedium();
        }
        else if (PlayerPrefs.GetInt("Quality", 3) == 3)
        {
            SetQualityHigh();
        }
    }
    void Manage_Assets(int qualityImg_Value)
    {
        if (GameManager._instance != null)
            Env = GameManager._instance.Environment;
        if (Env == null)
            return;
        if (qualityImg_Value == 1)
        {
            RenderSettings.fog = false;
            if (GameManager.ENV_Jungle)
            {
                ///////////////////
                var Loader = Resources.Load("Env/ForestHillLow");
                GameManager._instance.Terrain = (GameObject)Instantiate(Loader, Env.transform);
                Loader = null;
            }
        }
        else if (qualityImg_Value == 2)
        {
            RenderSettings.fog = false;
            if (GameManager.ENV_Desert)
            {
                var Loader = Resources.LoadAll("Env/Desert");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
            }
            else if (GameManager.ENV_Jungle)
            {
                var Loader = Resources.LoadAll("Env/Jungle");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
                //var Loaderx = Resources.Load("Env/ForestHillLow");
                //GameManager._instance.Terrain = (GameObject)Instantiate(Loaderx, Env.transform);
                //Loaderx = null;
            }
            else if (GameManager.ENV_Snow)
            {
                var Loader = Resources.LoadAll("Env/Snowy");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
            }
        }
        else if (qualityImg_Value == 3)
        {
            if (GameManager.ENV_Desert)
            {
                var Loader = Resources.LoadAll("Env/Desert");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
            }
            else if (GameManager.ENV_Jungle)
            {
                var Loader = Resources.LoadAll("Env/Jungle");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
                //var Loaderx = Resources.Load("Env/ForestHillLow");
                //GameManager._instance.Terrain = (GameObject)Instantiate(Loaderx, Env.transform);
                //Loaderx = null;
            }
            else if (GameManager.ENV_Snow)
            {
                var Loader = Resources.LoadAll("Env/Snowy");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
            }
        }
        else if (qualityImg_Value == 4)
        {
            HighQualityProps = true;
            if (GameManager.ENV_Desert)
            {
                var Loader = Resources.LoadAll("Env/Desert");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
            }
            else if (GameManager.ENV_Jungle)
            {
                var Loader = Resources.LoadAll("Env/Jungle");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
                //var Loaderx = Resources.Load("Env/ForestHillHigh");
                //GameManager._instance.Terrain = (GameObject)Instantiate(Loaderx, Env.transform);
                //Loaderx = null;
            }
            else if (GameManager.ENV_Snow)
            {
                var Loader = Resources.LoadAll("Env/Snowy");
                foreach (var t in Loader)
                {
                    Instantiate(t, Env.transform);
                }
                Loader = null;
            }
        }
        
    }
    public void SetQualityVeryLow()
    {
        QualitySettings.SetQualityLevel(0);
        Manage_Assets(1);
        PlayerPrefs.SetInt("Quality", 0);
    }
    public void SetQualityLow()
    {
        QualitySettings.SetQualityLevel(0);
        Manage_Assets(2);
        PlayerPrefs.SetInt("Quality", 1);
    }
    public void SetQualityMedium()
    {
        QualitySettings.SetQualityLevel(2);
        Manage_Assets(3);
        PlayerPrefs.SetInt("Quality", 2);
    }
    public void SetQualityHigh()
    {
        QualitySettings.SetQualityLevel(5);
        Manage_Assets(4);
        PlayerPrefs.SetInt("Quality", 3);
    }
}
