using UnityEngine;

public class FollowPlayerCam : MonoBehaviour
{
	public static FollowPlayerCam _instance;

	private bool followPlayer;

	public Transform player;

	private void Awake()
	{
		_instance = this;
		Invoke("SetPlayer", 0.5f);
	}

	private void SetPlayer()
	{
		player = GameObject.FindGameObjectWithTag("Player").transform;
		followPlayer = true;
	}

	private void LateUpdate()
	{
		if (followPlayer)
		{
			Vector3 position = player.position;
			position.y = base.transform.position.y;
			base.transform.position = position;
			base.transform.rotation = Quaternion.Euler(90f, player.eulerAngles.y, 0f);
		}
	}
}
