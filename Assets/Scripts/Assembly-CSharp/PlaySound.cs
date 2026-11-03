using System.Collections;
using UnityEngine;

[DisallowMultipleComponent]
public class PlaySound : MonoBehaviour
{
	[HideInInspector]
	public bool isPlayingClip;

	private void OnEnable()
	{
		SoundManager.SetVolumeEvent += HandleSetVolumeEvent;
		SoundManager.MuteEvent += HandleMuteEvent;
	}

	private void OnDisable()
	{
		SoundManager.SetVolumeEvent -= HandleSetVolumeEvent;
		SoundManager.MuteEvent -= HandleMuteEvent;
	}

	private void OnDestroy()
	{
		SoundManager.SetVolumeEvent -= HandleSetVolumeEvent;
		SoundManager.MuteEvent -= HandleMuteEvent;
	}

	private void HandleMuteEvent(bool isMute)
	{
		GetComponent<AudioSource>().mute = isMute;
	}

	private void HandleSetVolumeEvent(float percent)
	{
		GetComponent<AudioSource>().volume = percent;
	}

	public IEnumerator PlayClip(AudioClip audioClip, float volume)
	{
		isPlayingClip = true;
		GetComponent<AudioSource>().volume = volume;
		GetComponent<AudioSource>().PlayOneShot(audioClip);
		yield return new WaitForSeconds(audioClip.length);
		isPlayingClip = false;
	}

	public void StopPlaying()
	{
		GetComponent<AudioSource>().Stop();
	}
}
