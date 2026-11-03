using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class Typing : MonoBehaviour {

    public string message = "Hello World";
    public Text textComp;
    public float startdelay = 2.0f;
    public float typingDelay = 0.01f;
   // Use this for initialization
	void Start () {

        
	}
    public void Typer(string msg, float startTime)
    {
        message = msg;
        startdelay = startTime;
        StartCoroutine("TypeIn");
    }
    void Awake()
    {
        textComp = GetComponent<Text>();
    }

   public IEnumerator TypeIn()
    {
        yield return new WaitForSeconds(startdelay);

        if (this.gameObject.GetComponent<AudioSource>())
        {
            this.gameObject.GetComponent<AudioSource>().enabled = true;
            this.gameObject.transform.parent.gameObject.GetComponent<Image>().enabled = true;
        }
        for (int i = 0; i <= message.Length; i++)
        {
            textComp.text = message.Substring(0, i);
            yield return new WaitForSeconds(typingDelay);
        }
        if (this.gameObject.GetComponent<AudioSource>())
        {
            this.gameObject.GetComponent<AudioSource>().enabled = false;
        }

        Invoke("clear", 4f);
    }

   public IEnumerator TypeOff()
   {
       for (int i = message.Length; i >= 0; i--)
       {
           textComp.text = message.Substring(0, i);
           yield return new WaitForSeconds(typingDelay);
       }
   }

    IEnumerator clearText()
    {
		StopCoroutine ("TypeIn");
        yield return new WaitForSeconds(0.0f);
     //   gameObject.transform.parent.gameObject.SetActive(false);
        transform.gameObject.GetComponent<Text>().text = "";
        StopCoroutine("clearText");
    }

	public void clear()
	{
        this.gameObject.transform.parent.gameObject.GetComponent<Image>().enabled = false;
        StartCoroutine ("clearText");
	}
}
