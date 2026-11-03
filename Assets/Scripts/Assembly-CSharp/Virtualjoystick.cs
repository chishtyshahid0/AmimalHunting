using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Virtualjoystick : MonoBehaviour, IDragHandler, IPointerUpHandler, IPointerDownHandler, IEventSystemHandler
{
	private Image Bgimage;

	public Image Joystickimage;

	private Vector3 inputvector;

	public static bool isJoystickmoving;

	private Tutorial _Tutorialref;

	public static int Fingerid = -1;

	public static int Fingerid1 = -1;

	private void Start()
	{
		Bgimage = GetComponent<Image>();
		if ((bool)Tutorial.Obj)
		{
			_Tutorialref = Tutorial.Obj;
		}
	}

	public virtual void OnDrag(PointerEventData ped)
	{
        print("OnDragCalled....");
		if (_Tutorialref != null && _Tutorialref.Disablejoystick)
		{
			inputvector = Vector3.zero;
			Joystickimage.rectTransform.anchoredPosition = Vector3.zero;
		}
		if (RectTransformUtility.ScreenPointToLocalPointInRectangle(Bgimage.rectTransform, ped.position, ped.pressEventCamera, out var localPoint))
		{
			localPoint.x /= Bgimage.rectTransform.sizeDelta.x;
			localPoint.y /= Bgimage.rectTransform.sizeDelta.y;
			inputvector = new Vector3(localPoint.x * 2f + 1f, 0f, localPoint.y * 2f - 1f);
			inputvector = ((!(inputvector.magnitude > 1f)) ? inputvector : inputvector.normalized);
			Joystickimage.rectTransform.anchoredPosition = new Vector3(inputvector.x * (Bgimage.rectTransform.sizeDelta.x / 2f), inputvector.z * (Bgimage.rectTransform.sizeDelta.y / 2f));
		}
	}

	public virtual void OnPointerDown(PointerEventData ped)
	{
		OnDrag(ped);
		isJoystickmoving = true;
		StoreFingerId();
		if (_Tutorialref != null && _Tutorialref.count == 1)
		{
			_Tutorialref.Invoke("Enableshootnow", 3f);
		}
	}

	public virtual void OnPointerUp(PointerEventData ped)
	{
		Pointerup();
	}

	public void Pointerup()
	{
		inputvector = Vector3.zero;
		Joystickimage.rectTransform.anchoredPosition = Vector3.zero;
		isJoystickmoving = false;
		Fingerid = -1;
	}

	public static void StoreFingerId()
	{
		for (int i = 0; i < Input.touchCount; i++)
		{
			Fingerid = Input.GetTouch(i).fingerId;
		}
	}

	public static void StoreFingerId1()
	{
		for (int i = 0; i < Input.touchCount; i++)
		{
			Fingerid1 = Input.GetTouch(i).fingerId;
			if (Fingerid1 == CameraControllesAssaults.CamerafingerId)
			{
			}
		}
	}

	public static void StoreTouchId()
	{
		for (int i = 0; i < Input.touchCount; i++)
		{
			CameraControllesAssaults.CamerafingerId = Input.GetTouch(i).fingerId;
			CameraControllesAssaults.myScript.firstPoint = Input.GetTouch(CameraControllesAssaults.CamerafingerId).position;
			if (Fingerid1 == CameraControllesAssaults.CamerafingerId)
			{
			}
		}
	}

	public float Horizontal()
	{
		if (inputvector.x != 0f)
		{
			return inputvector.x;
		}
		return Input.GetAxis("Horizontal");
	}

	public float Vertical()
	{
		if (inputvector.z != 0f)
		{
			return inputvector.z;
		}
		return Input.GetAxis("Vertical");
	}

	private void OnDisable()
	{
		Pointerup();
	}
}
