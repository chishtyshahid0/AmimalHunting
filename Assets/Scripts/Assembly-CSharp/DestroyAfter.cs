using UnityEngine;

public class DestroyAfter : MonoBehaviour
{
	public float destroyAfter = 0.15f;

	private void OnEnable()
	{
		Invoke("Setfalse", destroyAfter);
	}

	private void Setfalse()
	{
		base.gameObject.SetActive(false);
	}
}
