using UnityEngine;

public class Checkunlockbutton : MonoBehaviour
{
	public enum Buttonstats
	{
		unlockallbikes,
		unlockallchallenges,
		Unlockall,
		Noads
	}

	public Buttonstats _Currentbuttonstatus;

	private void OnEnable()
	{
		Checkbuttonstatus();
	}

	public void Checkbuttonstatus()
	{
	}
}
