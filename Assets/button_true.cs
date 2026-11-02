
using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class button_true : MonoBehaviour
{
    public float DelayFor = 5f;

    public GameObject btn;

    void START()
    {
       

        StartCoroutine(FPS_checking());
    }

    IEnumerator FPS_checking()
    {
        yield return new WaitForSecondsRealtime(DelayFor);

        
        btn.SetActive(true);
    }
}
