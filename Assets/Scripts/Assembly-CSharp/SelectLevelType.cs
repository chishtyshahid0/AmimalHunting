using UnityEngine;

public class SelectLevelType : MonoBehaviour
{
	public enum LevelTheme
	{
		forest,
		snow,
		desert
	}

	public LevelTheme theme;

	public static SelectLevelType _instance;

	private void Awake()
	{
		_instance = this;
	}
}
