using UnityEngine;

public class Minimap : MonoBehaviour
{
	public Transform player;

	private void LateUpdate()
	{
		Vector3 position = player.position;
		position.y = base.transform.position.y;
		base.transform.position = position;
		base.transform.rotation = Quaternion.Euler(90f, player.eulerAngles.y, 0f);
	}
}
