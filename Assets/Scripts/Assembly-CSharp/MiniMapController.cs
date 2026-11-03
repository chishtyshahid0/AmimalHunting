using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MiniMapController : MonoBehaviour
{
	public Transform playerPos;

	public Camera mapCamera;

	public GameObject truckIcon;

	private bool setP;

	public static List<MapObject> mapObjects = new List<MapObject>();

	private void Start()
	{
		Invoke("SetPlayer", 1f);
	}

	private void SetPlayer()
	{
		playerPos = FollowPlayerCam._instance.player.transform;
	}

	private void OnEnable()
	{
		mapCamera = Object.FindObjectOfType<FollowPlayerCam>().GetComponent<Camera>();
	}

	public static void RegisterMapObject(GameObject o, Image i)
	{
		Image icon = Object.Instantiate(i);
		mapObjects.Add(new MapObject
		{
			owner = o,
			icon = icon
		});
	}

	public static void RemoveMapObject(GameObject o)
	{
		List<MapObject> list = new List<MapObject>();
		for (int i = 0; i < mapObjects.Count; i++)
		{
			if (mapObjects[i].owner == o)
			{
				Object.Destroy(mapObjects[i].icon);
			}
			else
			{
				list.Add(mapObjects[i]);
			}
		}
		mapObjects.RemoveRange(0, mapObjects.Count);
		mapObjects.AddRange(list);
	}

	private void DrawMapIcons()
	{
		foreach (MapObject mapObject in mapObjects)
		{
			Vector2 vector = new Vector2(mapObject.owner.transform.position.x, mapObject.owner.transform.transform.position.y);
			Vector2 vector2 = new Vector2(playerPos.position.x, playerPos.position.y);
			Vector3 position = mapCamera.WorldToViewportPoint(mapObject.owner.transform.position);
			mapObject.icon.transform.SetParent(base.transform);
			RectTransform component = GetComponent<RectTransform>();
			Vector3[] array = new Vector3[4];
			component.GetWorldCorners(array);
			position.x = Mathf.Clamp(position.x * component.rect.width + array[0].x, array[0].x, array[2].x);
			position.y = Mathf.Clamp(position.y * component.rect.height + array[0].y, array[0].y, array[1].y);
			position.z = 0f;
			mapObject.icon.transform.position = position;
		}
	}

	private void Update()
	{
		if (!(playerPos == null))
		{
			DrawMapIcons();
		}
	}
}
