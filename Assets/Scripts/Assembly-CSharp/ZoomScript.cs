using UnityEngine;

public class ZoomScript : MonoBehaviour
{
	public static ZoomScript myScript;

	public GameObject SliderObj;

	public float Height_Min;

	public float Height_Max;

	private float Height_Total;

	public bool Touch_Enable;

	private Vector2 Pos_Touch;

	public int ZoomValue;

	private void Awake()
	{
		myScript = this;
	}

	private void Start()
	{
		Input.multiTouchEnabled = true;
		Height_Total = Height_Max - Height_Min;
	}

	private void Update()
	{
		if (Touch_Enable)
		{
			Pos_Touch = Camera.main.ScreenToViewportPoint(Input.mousePosition);
			if (Pos_Touch.y <= Height_Max && Pos_Touch.y >= Height_Min)
			{
				ZoomValue = (int)((SliderObj.transform.position.y - Height_Min) / Height_Total * Height_Max * 10f * 2f);
				SliderObj.transform.position = new Vector3(SliderObj.transform.position.x, Pos_Touch.y, 10f);
			}
			if (Input.GetMouseButtonUp(0))
			{
				Touch_Enable = false;
			}
		}
	}

	private void OnGUI()
	{
	}
}
