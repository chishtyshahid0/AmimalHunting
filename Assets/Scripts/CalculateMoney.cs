using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class CalculateMoney : MonoBehaviour
{
    public AudioClip coinsounds;
    public Text RewardText;
    public static int TVal;
    GameObject Coinscountingobject;
    AudioSource sourcecoins;
    // Start is called before the first frame update
    void OnEnable()
    {
        //Coinscountingsource
        Coinscountingobject = new GameObject();
        Coinscountingobject.AddComponent<AudioSource>();
        Coinscountingobject.SetActive(true);
        sourcecoins = Coinscountingobject.GetComponent<AudioSource>();
        sourcecoins.enabled = true;
        sourcecoins.loop = false;
        sourcecoins.playOnAwake = false;
        sourcecoins.clip = coinsounds;
        StartCoroutine("AnimateFunction");
    }

    IEnumerator AnimateFunction()
    {
        transform.GetChild(0).gameObject.SetActive(true);
        yield return new WaitForSecondsRealtime(2.5f);//Un_Opened Crate Panel Reward wala 
        transform.GetChild(0).GetComponent<Animator>().enabled = true;
        yield return new WaitForSecondsRealtime(1f);
        transform.GetChild(1).gameObject.SetActive(true);
        //TVal = Random.Range(400, 950);
        yield return new WaitForSecondsRealtime(1.2f);
        LeanTween.value(gameObject, EarningCoins, 0, TVal, 1.5f).setEase(LeanTweenType.easeInOutCubic).setIgnoreTimeScale(true);
        yield return new WaitForSecondsRealtime(4f);//Opened Crate Panel Reward wala 
        transform.GetChild(1).GetComponent<Animator>().enabled = true;
        yield return new WaitForSecondsRealtime(1f);//Parent Panel Reward wala 
        PageHandler._instance.Open_Store();
        transform.parent.gameObject.SetActive(false);
        StopCoroutine("AnimateFunction");
    }
    void EarningCoins(float NewValue)
    {
        RewardText.text = Mathf.RoundToInt(NewValue) + " Coins";
        sourcecoins.Play();
    }
}
