using UnityEngine;

public class Disableit : MonoBehaviour
{
	public float Timedelay = 0.15f;

	private void OnEnable()
	{
		Invoke("Disableobjnow", Timedelay);
	}
    private void OnDisable()
    {
        CancelInvoke("Disableobjnow");
    }
    private void Disableobjnow()
	{
		gameObject.SetActive(false);
	}
}
