using UnityEngine;

public class Drive : MonoBehaviour
{
	public float speed;

	public float rotationSpeed;

	private void Start()
	{
	}

	private void Update()
	{
		float num = Input.GetAxis("Vertical") * speed;
		float num2 = Input.GetAxis("Horizontal") * rotationSpeed;
		num *= Time.deltaTime;
		num2 *= Time.deltaTime;
		base.transform.Translate(0f, 0f, num);
		base.transform.Rotate(0f, num2, 0f);
	}
}
