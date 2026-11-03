using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
using System.Collections;

public class TimedObjActivater : MonoBehaviour
{
    public float DelayFor = 5f;
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine("FPS_checking");
    }
    IEnumerator FPS_checking()
    {
        //transform.localScale = new Vector3(0, 0, 0);
        //transform.gameObject.SetActive(false);
        //GetComponent<Animator>().enabled = true;
        yield return new WaitForSecondsRealtime(DelayFor);
        //transform.localScale = new Vector3(1, 1, 1);
        //transform.gameObject.SetActive(true);
        GetComponent<Animator>().enabled = true;
    }
}
