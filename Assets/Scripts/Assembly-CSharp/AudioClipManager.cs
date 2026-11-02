using System.Collections;
using UnityEngine;

public class AudioClipManager : MonoBehaviour
{
	public AudioClip[] Sounds;

	private static AudioClipManager _instance;

	public static AudioClipManager Instance
	{
		get
		{
			if (_instance == null)
			{
				_instance = Object.FindObjectOfType<AudioClipManager>();
			}
			return _instance;
		}
	}

	public void Play(MenuSounds menuSound)
	{
		switch (menuSound)
		{
		case MenuSounds.BG:
			if (canPlay((int)menuSound))
			{
				BGSoundManager.Instance.PlayAudioClip(Sounds[(int)menuSound]);
			}
			break;
		case MenuSounds.LoadingIn:
			if (canPlay((int)menuSound))
			{
				SoundManager.Instance.PlayAudioClip(Sounds[(int)menuSound]);
			}
			break;
		case MenuSounds.LoadingOut:
			if (canPlay((int)menuSound))
			{
				SoundManager.Instance.PlayAudioClip(Sounds[(int)menuSound]);
			}
			break;
		default:
			if (canPlay((int)menuSound))
			{
				SoundManager.Instance.PlayAudioClip(Sounds[(int)menuSound]);
			}
			break;
		}
	}

	public void Play(InGameSounds soundIndex)
	{
		if (soundIndex == InGameSounds.BG)
		{
			if (canPlay((int)soundIndex))
			{
				BGSoundManager.Instance.PlayAudioClip(Sounds[(int)soundIndex]);
			}
		}
		else if (canPlay((int)soundIndex))
		{
			switch (soundIndex)
			{
			case InGameSounds.BG:
				SoundManager.Instance.PlayAudioClip(Sounds[(int)soundIndex]);
				break;
			case InGameSounds.LevelComplete:
				SoundManager.Instance.PlayAudioClip(Sounds[(int)soundIndex]);
				break;
			default:
				SoundManager.Instance.PlayAudioClip(Sounds[(int)soundIndex]);
				break;
			}
		}
	}

	private IEnumerator PlaywithDelay(int soundIndex)
	{
		yield return new WaitForSeconds(0f);
		SoundManager.Instance.PlayAudioClip(Sounds[soundIndex], 0.5f);
	}

	public void Play(int soundIndex)
	{
		switch (soundIndex)
		{
		case 0:
			if (canPlay(soundIndex))
			{
				BGSoundManager.Instance.PlayAudioClip(Sounds[soundIndex]);
			}
			break;
		case 4:
			if (canPlay(soundIndex))
			{
				SoundManager.Instance.PlayAudioClip(Sounds[soundIndex]);
			}
			break;
		default:
			if (canPlay(soundIndex))
			{
				SoundManager.Instance.PlayAudioClip(Sounds[soundIndex]);
			}
			break;
		}
	}

	public IEnumerator BGvolumeChanger(float waitTime)
	{
		yield return new WaitForSeconds(waitTime);
		BGSoundManager.Instance.SetVolume(100f);
	}

	private bool canPlay(int index)
	{
		if (index < Sounds.Length && Sounds[index] != null)
		{
			return true;
		}
		return false;
	}
}
