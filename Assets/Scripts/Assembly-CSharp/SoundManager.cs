using System.Collections.Generic;
using UnityEngine;

public class SoundManager : MonoBehaviour
{
	public delegate void SetVolumeDelegate(float percent);

	public delegate void MuteDelegate(bool isMute);

	[HideInInspector]
	public int AudioSourcesLength = 1;

	public GameObject CustomAudioSourcePrefab;

	public List<AudioClip> Clips;

	private List<PlaySound> AudioSources;

	private bool isMute;

	private static SoundManager _instance;

	public static SoundManager Instance
	{
		get
		{
			if (_instance == null)
			{
				_instance = Object.FindObjectOfType<SoundManager>();
			}
			if (_instance == null)
			{
				GameObject gameObject = new GameObject("SoundManager");
				_instance = gameObject.AddComponent<SoundManager>();
			}
			return _instance;
		}
	}

	public bool IsMute
	{
		get
		{
			return isMute;
		}
		set
		{
			isMute = value;
			if (SoundManager.MuteEvent != null)
			{
				SoundManager.MuteEvent(value);
			}
		}
	}

	public static event SetVolumeDelegate SetVolumeEvent;

	public static event MuteDelegate MuteEvent;

	private void Awake()
	{
		Object.DontDestroyOnLoad(this);
		if (AudioSources == null)
		{
			AudioSources = new List<PlaySound>();
		}
	}

	private PlaySound CreateAudioSource()
	{
		AudioSource audioSource;
		if ((bool)CustomAudioSourcePrefab)
		{
			GameObject gameObject = Object.Instantiate(CustomAudioSourcePrefab);
			audioSource = gameObject.GetComponent<AudioSource>();
		}
		else
		{
			GameObject gameObject2 = new GameObject();
			audioSource = gameObject2.AddComponent<AudioSource>();
		}
		audioSource.transform.parent = base.transform;
		PlaySound playSound = audioSource.gameObject.AddComponent<PlaySound>();
		audioSource.mute = IsMute;
		audioSource.volume = 1f;
		AudioSources.Add(playSound);
		audioSource.name = "AudioSource" + AudioSources.Count;
		return playSound;
	}

	public void PlayAudioClip(AudioClip clip, float volume = 1f)
	{
		if (!clip)
		{
			return;
		}
		bool flag = false;
		for (int i = 0; i < AudioSources.Count; i++)
		{
			if (!AudioSources[i].isPlayingClip)
			{
				flag = true;
				StartCoroutine(AudioSources[i].PlayClip(clip, volume));
				break;
			}
		}
		if (!flag)
		{
			//Debug.Log("Creating new AudioSource");
			StartCoroutine(CreateAudioSource().PlayClip(clip, volume));
		}
	}

	public void PlayAudioClip(int clipNo)
	{
		PlayAudioClip(Clips[clipNo]);
	}

	public void PlayAudioClip(GameObject customAudioSourcePrefab, AudioClip clip)
	{
		CustomAudioSourcePrefab = customAudioSourcePrefab;
		PlayAudioClip(clip);
	}

	public void PlayAudioClip(GameObject customAudioSourcePrefab, int clipNo)
	{
		CustomAudioSourcePrefab = customAudioSourcePrefab;
		PlayAudioClip(clipNo);
	}

	public void SetVolume(float percent)
	{
		if (SoundManager.SetVolumeEvent != null)
		{
			SoundManager.SetVolumeEvent(percent * 0.01f);
		}
	}

	private void OnLevelWasLoaded()
	{
		for (int i = 0; i < AudioSources.Count; i++)
		{
			AudioSources[i].StopPlaying();
		}
	}
}
