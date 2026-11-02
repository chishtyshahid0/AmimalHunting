using UnityEngine;

public class BGSoundManager : MonoBehaviour
{
	private static BGSoundManager _instance;

	public static BGSoundManager Instance
	{
		get
		{
			if (_instance == null)
			{
				_instance = Object.FindObjectOfType<BGSoundManager>();
			}
			if (_instance == null)
			{
				GameObject gameObject = new GameObject("BGSoundManager");
				_instance = gameObject.AddComponent<BGSoundManager>();
			}
			return _instance;
		}
	}

	public bool IsMute
	{
		get
		{
			return GetComponent<AudioSource>().mute;
		}
		set
		{
			GetComponent<AudioSource>().mute = value;
		}
	}

	private void Awake()
	{
		if (!GetComponent<AudioSource>())
		{
			base.gameObject.AddComponent<AudioSource>();
		}
		SetVolume(100f);
		Object.DontDestroyOnLoad(this);
	}

	public void PlayAudioClip(AudioClip audioClip)
	{
		if (GetComponent<AudioSource>().isPlaying)
		{
			GetComponent<AudioSource>().Stop();
		}
		GetComponent<AudioSource>().clip = audioClip;
		GetComponent<AudioSource>().loop = true;
		GetComponent<AudioSource>().Play();
	}

	public void StopPlaying()
	{
		if (GetComponent<AudioSource>().isPlaying)
		{
			GetComponent<AudioSource>().Stop();
		}
	}

	public void SetVolume(float percent)
	{
		GetComponent<AudioSource>().volume = percent * 0.01f;
	}

	public void ResumeSound()
	{
		GetComponent<AudioSource>().Play();
	}

	public void PauseSound()
	{
		GetComponent<AudioSource>().Pause();
	}
}
