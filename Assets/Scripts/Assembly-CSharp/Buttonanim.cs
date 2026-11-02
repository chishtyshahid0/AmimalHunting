using UnityEngine;

public class Buttonanim : MonoBehaviour
{
	public float delayvalue = 1f;

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
		base.transform.localScale = Vector3.one;
	}
}
