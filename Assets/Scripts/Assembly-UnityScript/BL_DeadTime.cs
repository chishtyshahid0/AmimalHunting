using System;
using UnityEngine;

[Serializable]
public class BL_DeadTime : MonoBehaviour
{
	public float deadTime;

	public void Awake()
	{
		Destroy(gameObject, deadTime);
	}

	public  void Main()
	{
	}
}
