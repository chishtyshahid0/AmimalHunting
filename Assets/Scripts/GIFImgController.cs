using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GIFImgController : MonoBehaviour
{
    public bool Useforanimator = false;
    public float delaybetween = 0.6f;
    // Start is called before the first frame update
    void OnEnable()
    {
        ArrowsOff();
        StartCoroutine("Animation");
    }
    IEnumerator Animation()
    {
        for (int x = 0; x < transform.childCount; x++)
        {
            yield return new WaitForSecondsRealtime(delaybetween);
            if(!Useforanimator)
                ArrowsOff();
            transform.GetChild(x).gameObject.SetActive(true);
        }
        StopCoroutine("Animation");
        if (!Useforanimator)
            StartCoroutine("Animation");
    }

    public void ArrowsOff()
    {
        for (int x = 0; x < transform.childCount; x++)
        {
            transform.GetChild(x).gameObject.SetActive(false);
        }
    }
}
