using UnityEngine;

public class CheckAIplayeralert : MonoBehaviour
{
	private void Start()
	{
	}

	private void OnTriggerEnter(Collider col)
	{
		if (col.gameObject.layer == 10)
		{
			col.transform.root.SendMessageUpwards("Alertplayernow", SendMessageOptions.DontRequireReceiver);
		}
	}
}
