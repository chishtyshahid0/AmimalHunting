using UnityEngine;
using UnityEngine.UI;

public class SettingsHCT : MonoBehaviour
{

	private int soundValue = 1;

	public Image soundBtn;

	public Sprite soundOn;

	public Sprite soundOff;

	private void Start()
	{
		CheckSound();
	}

	public void CheckSound()
	{
		AudioClipManager.Instance.Play(1);
		if (soundValue == 0)
		{
			soundBtn.sprite = soundOff;
			Debug.Log("SoundOff");
			AudioListener.volume = 0f;
			soundValue = 1;
		}
		else if (soundValue == 1)
		{
			soundBtn.sprite = soundOn;
			Debug.Log("SoundOn");
			AudioListener.volume = 1f;
			soundValue = 0;
		}
	}
}
