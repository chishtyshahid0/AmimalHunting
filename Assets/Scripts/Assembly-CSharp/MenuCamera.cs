using UnityEngine;

public class MenuCamera : MonoBehaviour
{
	public Transform target;

	public float smooth = 0.03f;

	public float distance = 5f;

	private float yVelocity;

	private float time1;

	private float time2;

	private float yVelocity1;

	private float yVelocity2;

	private float xVelocity;

	private bool isTap;

	public float speed;

	public float yOffset;

	public float startCameraDis;

	public bool _rotateAround;

	public bool isSingleTouchEnabled;

	private Vector3 initialPos = Vector3.zero;

	private float xDiff;

	private float yDiff;

	private float xOffset;

	private float touchRightLimit;

	private float touchLeftLimit;

	private float response = 2f;

	private float tempXDiff;

	private float yOffset1;

	public Transform _tempTransform;

	public static MenuCamera mee;

	private void Start()
	{
		mee = this;
		touchLeftLimit = 0f;
		touchRightLimit = Screen.width;
		iTween.CameraFadeAdd();
		iTween.CameraFadeFrom(0.5f, 1f);
	}

	public void SetCameraDistance()
	{
		float y = 0f;
		Vector3 position = target.position;
		position += Quaternion.Euler(0f, y, 0f) * new Vector3(0f, 10f, 0f - startCameraDis);
		base.transform.position = position;
		base.transform.LookAt(target);
	}

	private void MoveTheCamera()
	{
		xOffset -= 180f;
	}

	private void Update()
	{
		Vector3 localEulerAngles = base.transform.localEulerAngles;
		localEulerAngles.x = Mathf.Clamp(localEulerAngles.x, 0f, 50f);
		base.transform.localEulerAngles = localEulerAngles;
		if (_rotateAround)
		{
			_tempTransform.transform.RotateAround(target.transform.position, Vector3.up, xOffset * 50f * Time.deltaTime);
			if (yOffset1 < 0f && base.transform.localEulerAngles.x < 25f)
			{
				base.transform.RotateAround(target.transform.position, base.transform.right, (0f - yOffset1) * 20f * Time.deltaTime);
			}
			else if (yOffset1 > 0f && base.transform.localEulerAngles.x > 5f)
			{
				base.transform.RotateAround(target.transform.position, base.transform.right, (0f - yOffset1) * 20f * Time.deltaTime);
			}
			if (Input.GetMouseButton(0))
			{
				if (Input.mousePosition.x > touchLeftLimit && Input.mousePosition.x < touchRightLimit)
				{
					if (Input.GetMouseButtonDown(0))
					{
						initialPos = Input.mousePosition;
						isSingleTouchEnabled = true;
					}
					if (Input.GetMouseButtonUp(0) && isSingleTouchEnabled)
					{
						isSingleTouchEnabled = false;
					}
				}
				else
				{
					isSingleTouchEnabled = false;
				}
			}
			else
			{
				isSingleTouchEnabled = false;
			}
		}
		if (isSingleTouchEnabled)
		{
			xDiff = Input.mousePosition.x - initialPos.x;
			if (xDiff != 0f)
			{
				tempXDiff = xDiff;
			}
			yDiff = Input.mousePosition.y - initialPos.y;
			initialPos = Input.mousePosition;
			if (Mathf.Abs(xDiff) > 0.01f)
			{
				xOffset = xDiff * response;
			}
			if (Mathf.Abs(yDiff) > 0.01f)
			{
				yOffset1 = yDiff * response;
			}
			yOffset1 = Mathf.Clamp(yOffset1, -10f, 10f);
		}
		xOffset *= 0.5f;
		yOffset1 *= 0.5f;
		base.transform.LookAt(target);
	}

	private void LateUpdate()
	{
		if (!isSingleTouchEnabled && _rotateAround)
		{
			if (tempXDiff > 0f)
			{
				xDiff = 0.05f;
			}
			else
			{
				xDiff = -0.05f;
			}
			xOffset = xDiff * response;
		}
	}
}
