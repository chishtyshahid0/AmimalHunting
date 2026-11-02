using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class CameraControllesAssaults : MonoBehaviour
{
	public static CameraControllesAssaults myScript;

	public float _minXAngle;

	public float _maxXAngle;

	public float _minYAngle;

	public float _maxYAngle;

	public float sensitivityX;

	public float sensitivityY;

	private Camera _targetCamera;

	public static float _targetFieldOfView;

	public static float speed;

	public float rotationY;

	public float rotationX;

	public Vector3 firstPoint;

	public Vector3 secondPoint;

	public Vector3 FinalRotWithLerp;

	public float extraXVal;

	public float extraYVal;

	public float xTemp;

	public float yTemp;

	public float downTime;

	public float scopeVal;

	public float tempRotationY;

	public float tempRotationX;

	private bool zoomMode;

	public int _targetZoomVal;

	public static int CamerafingerId = -1;

	public Image Btn_Zoom;

	public Image Btn_ZoomSlider;

	public bool Ignorenow;

	public GraphicRaycaster _Raycaster;

	public EventSystem _Eventsystemref;

	private PointerEventData _pointereventdata;

	private Tutorial _Tutorialref;

	private int Ignorevalue = -1;

	private float speedvalue = 0.5f;

	public Texture Tex_Zoom1;

	public Texture Tex_Zoom2;

	private Vector2 Firstposition;

	private Vector2 checkmagnitude;

    public Slider Slidder;

    private void Awake()
	{
		myScript = this;
	}

	private void Start()
	{
		Vector3 localEulerAngles = new Vector3(0f - rotationY + extraXVal, rotationX + extraYVal, 0f);
		base.transform.localEulerAngles = localEulerAngles;
		_targetFieldOfView = 60f;
		speed = 20f;
		_targetCamera = GetComponent<Camera>();
		Input.multiTouchEnabled = true;
		_pointereventdata = new PointerEventData(_Eventsystemref);
		if ((bool)Tutorial.Obj)
		{
			_Tutorialref = Tutorial.Obj;
		}
        Starting_slidervalue();

    }
    void Starting_slidervalue()
    {
        Slidder.value = PlayerPrefs.GetFloat("slidervalue", 2);
        Sensitivity = Slidder.value;
    }
    private float Sensitivity=2f; 
    public void SliderValueFunction()
    {
        Sensitivity = Slidder.value;
        PlayerPrefs.SetFloat("slidervalue", Sensitivity);
    }
    private void Update()
	{
		if (Time.timeScale == 0f || Ignorenow)
		{
			return;
		}
		SetFieldOfView();
		if (Input.touchCount > 0)
		{
			for (int i = 0; i < Input.touches.Length; i++)
			{
				if (Input.GetTouch(i).phase == TouchPhase.Began || Input.GetTouch(i).phase == TouchPhase.Stationary || Input.GetTouch(i).phase == TouchPhase.Moved)
				{
					_pointereventdata.position = Input.GetTouch(i).position;
					List<RaycastResult> list = new List<RaycastResult>();
					_Raycaster.Raycast(_pointereventdata, list);
					Debug.Log("_________");
					for (int j = 0; j < list.Count; j++)
					{
						if (list[j].gameObject.transform.name.Contains("Joystick"))
						{
							Ignorevalue = i;
							break;
						}
					}
				}
				if (i != Ignorevalue)
				{
					rotationX += Input.GetTouch(i).deltaPosition.x * (_targetFieldOfView / 40f) * ((float)Input.touchCount / Sensitivity);
					rotationY += Input.GetTouch(i).deltaPosition.y * (_targetFieldOfView / 40f) * ((float)Input.touchCount / Sensitivity);
				}
				if (Ignorevalue == i && Ignorevalue >= 0 && (Input.GetTouch(i).phase == TouchPhase.Ended || Input.GetTouch(i).phase == TouchPhase.Canceled))
				{
					Ignorevalue = -1;
				}
				rotationY = Mathf.Clamp(rotationY, _minYAngle + _targetFieldOfView / 40f, _maxYAngle + _targetFieldOfView / 20f);
				if (!(_Tutorialref != null) || _Tutorialref.count != 0)
				{
					continue;
				}
				if (Input.GetTouch(i).phase == TouchPhase.Began)
				{
					Firstposition = Input.GetTouch(i).deltaPosition;
				}
				if (Input.GetTouch(i).phase == TouchPhase.Moved)
				{
					checkmagnitude = Input.GetTouch(i).deltaPosition - Firstposition;
					if (checkmagnitude.magnitude > 10f)
					{
						_Tutorialref.count = 1;
						_Tutorialref.Enabletexts(1);
					}
				}
			}
		}
		extraXVal = Mathf.Sin(Time.time) / 100f;
		extraYVal = Mathf.Cos(Time.time) / 100f;
		FinalRotWithLerp.x = Mathf.Lerp(FinalRotWithLerp.x, rotationX, Time.deltaTime * 2f);
		FinalRotWithLerp.y = Mathf.Lerp(FinalRotWithLerp.y, rotationY, Time.deltaTime * 2f);
		FinalRotWithLerp.z = 0f;
		Vector3 localEulerAngles = new Vector3(0f - FinalRotWithLerp.y + extraXVal, FinalRotWithLerp.x + extraYVal, 0f);
		base.transform.localEulerAngles = localEulerAngles;
	}

	private void ButtonEventDown(Vector3 Pos)
	{
        print("IsCalledZoomFunctioning");
        //Btn_Zoom.rectTransform.anchoredPosition3D
		//if (Btn_Zoom.GetScreenRect().Contains(Pos))
		//{
		//	if (Btn_Zoom.texture == Tex_Zoom1)
		//	{
		//		Btn_Zoom.texture = Tex_Zoom2;
		//	}
		//	else
		//	{
		//		Btn_Zoom.texture = Tex_Zoom1;
		//	}
		//	ZoomCamera();
		//}
	}

	private void SetFieldOfView()
	{
		if (_targetFieldOfView != _targetCamera.fieldOfView)
		{
			if (_targetCamera.fieldOfView > _targetFieldOfView + 1f)
			{
				_targetCamera.fieldOfView -= Time.deltaTime * speed;
			}
			else if (_targetCamera.fieldOfView < _targetFieldOfView - 1f)
			{
				_targetCamera.fieldOfView += Time.deltaTime * speed;
			}
			else
			{
				_targetCamera.fieldOfView = _targetFieldOfView;
			}
		}
	}

	public void ZoomCamera()
	{
		if (!zoomMode)
		{
			zoomMode = true;
			_targetFieldOfView = _targetZoomVal - ZoomScript.myScript.ZoomValue;
		}
		else
		{
			zoomMode = false;
			_targetFieldOfView = 40f;
		}
	}

	public void ExtraZoom()
	{
		_targetFieldOfView = _targetZoomVal - ZoomScript.myScript.ZoomValue;
	}
}
