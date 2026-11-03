using System.Collections.Generic;
using UnityEngine;

public class PathFollowManager : MonoBehaviour
{
	public List<Transform> wayPoints;

	private void Start()
	{
		Transform[] componentsInChildren = base.transform.GetComponentsInChildren<Transform>();
		Transform[] array = componentsInChildren;
		foreach (Transform transform in array)
		{
			if (!transform.GetComponent<PathFollowManager>())
			{
				wayPoints.Add(transform);
			}
		}
		Invoke("DisableAllWayPoints", 1f);
	}

	private void DisableAllWayPoints()
	{
		for (int i = 1; i < wayPoints.Count; i++)
		{
			wayPoints[i].gameObject.SetActive(false);
		}
	}
}
