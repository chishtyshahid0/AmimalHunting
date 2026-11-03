using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class EnvironmentSelection : MonoBehaviour
{
    public AudioClip buttonSound;
    //public int OpenIndex;
    public GameObject StartBtn,Arrow;
    public GameObject[] EnvImage,EnvBtn, EnvBtn2;
    private void OnEnable()
    {
        StartBtn.GetComponent<Button>().interactable = false;
        if (GameEnum.ForestLevel >= 4)
        {
            //Unlocking Snow Mode Here
            EnvBtn[1].GetComponent<Button>().interactable = true;
            EnvBtn[1].transform.Find("BUY").gameObject.SetActive(false);
            EnvBtn2[1].GetComponent<Button>().interactable = true;
            EnvBtn2[1].transform.Find("BUY").gameObject.SetActive(false);

        }
        if (GameEnum.ForestLevel >= 9)
        {
            //Unlocking Desert Mode Here 
            EnvBtn[2].GetComponent<Button>().interactable = true;
            EnvBtn[2].transform.Find("BUY").gameObject.SetActive(false);
            EnvBtn2[2].GetComponent<Button>().interactable = true;
            EnvBtn2[2].transform.Find("BUY").gameObject.SetActive(false);
        }
    }
    void Start()
    {
    }
    public void SelectEnvironment(int Env)
    {
        OnEnable();
        AudioClipManager.Instance.Play(0);
        GameManager.ENV_Jungle = false; GameManager.ENV_Snow = false; GameManager.ENV_Desert = false;
        for (int num = 0; num < EnvImage.Length; num++)
            EnvImage[num].SetActive(false);
        for (int num = 0; num < EnvBtn.Length; num++)
            EnvBtn[num].transform.GetChild(0).gameObject.SetActive(false);
        for (int num = 0; num < EnvBtn2.Length; num++)
            EnvBtn2[num].transform.GetChild(0).gameObject.SetActive(false);
        if (Env == 1)//jungle
        {
            GameManager.ENV_Jungle = true;
        }
        else if (Env == 2)//snow
        {
            GameManager.ENV_Snow = true;
        }
        else if (Env == 3)//desert
        {
            GameManager.ENV_Desert = true;
        }
        Env--;
        EnvImage[Env].SetActive(true);
        EnvBtn[Env].transform.GetChild(0).gameObject.SetActive(true);
        EnvBtn2[Env].transform.GetChild(0).gameObject.SetActive(true);
        Arrow.SetActive(false); Arrow.SetActive(true);
        StartBtn.GetComponent<Button>().interactable = true;
    }
    public void SelectedFinal()
    {
        AudioClipManager.Instance.Play(0);
        PageHandler._instance.Open_UpgradeGuns();
    }

    public void LockedMessageSnowy()
    {
        AudioClipManager.Instance.Play(0);
        PageHandler._instance.LockedPanel.SetActive(true);
        PageHandler._instance.LockedTxt.text = "Requirement: Complete 5 levels in Forest Mode to Unlock this Mode ...!";
    }
    public void LockedMessageDesert()
    {
        AudioClipManager.Instance.Play(0);
        PageHandler._instance.LockedPanel.SetActive(true);
        PageHandler._instance.LockedTxt.text = "Requirement: Complete 10 levels in Forest Mode to Unlock this Mode ...!";
    }
}
