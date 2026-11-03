using UnityEngine;
using UnityEngine.UI;

public class Tutorial : MonoBehaviour
{
	public static Tutorial Obj;

	public Image Pausebtn;

	public Image Joystickbtn;

	public Image Shootbtn;

	public Image Zoombtn;

	public Image Crouchbtn;

	public Image Jumpbtn;

	public int count;

	public GameObject[] Alltutorialtexts;

	public bool Disablejoystick;

	private void Awake()
	{
		base.gameObject.SetActive(false);
		Obj = this;
	}

	private void Start()
	{
		Pausebtn.raycastTarget = false;
		Joystickbtn.raycastTarget = false;
		Shootbtn.raycastTarget = false;
		Zoombtn.raycastTarget = false;
		Crouchbtn.raycastTarget = false;
		Jumpbtn.raycastTarget = false;
		Jumpbtn.enabled = false;
		Crouchbtn.enabled = false;
		Enabletexts(0);
	}

	public void Enabletexts(int Num)
	{
		Disablealltexts();
		Alltutorialtexts[Num].SetActive(true);
		if (Num == 3)
		{
			Zoombtn.raycastTarget = true;
		}
	}

	public void Disablealltexts()
	{
		for (int i = 0; i < Alltutorialtexts.Length; i++)
		{
			Alltutorialtexts[i].SetActive(false);
		}
	}

	public void Enableshootnow()
	{
		Enabletexts(2);
		count = 2;
		Shootbtn.raycastTarget = true;
		Disablejoystick = true;
	}

	public void Enablezoomoutbutton()
	{
		Enabletexts(4);
		count = 4;
		Zoombtn.raycastTarget = true;
	}

	public void EnableCrouchbutton()
	{
		Crouchbtn.enabled = true;
		Crouchbtn.raycastTarget = true;
	}

	public void Enabelallbuttons()
	{
		Pausebtn.raycastTarget = true;
		Joystickbtn.raycastTarget = true;
		Shootbtn.raycastTarget = true;
		Zoombtn.raycastTarget = true;
		Crouchbtn.raycastTarget = true;
		Jumpbtn.raycastTarget = true;
		Jumpbtn.enabled = true;
		Crouchbtn.enabled = true;
		Disablejoystick = false;
	}
}
