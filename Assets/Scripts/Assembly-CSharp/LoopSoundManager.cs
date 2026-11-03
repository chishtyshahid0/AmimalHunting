using UnityEngine;

public class LoopSoundManager : MonoBehaviour
{
	private static LoopSoundManager _instance;

	private bool isPauseCalled;

	public static LoopSoundManager Instance
	{
		get
		{
			if (_instance == null)
			{
				_instance = Object.FindObjectOfType<LoopSoundManager>();
			}
			if (_instance == null)
			{
				GameObject gameObject = new GameObject("LoopSoundManager");
				_instance = gameObject.AddComponent<LoopSoundManager>();
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
		GetComponent<AudioSource>().loop = true;
	}

	public void Pause()
	{
		if (GetComponent<AudioSource>().isPlaying)
		{
			isPauseCalled = true;
			GetComponent<AudioSource>().Pause();
		}
	}

	public void Resume()
	{
		isPauseCalled = false;
		if (!GetComponent<AudioSource>().isPlaying)
		{
			GetComponent<AudioSource>().Play();
		}
	}

	public void Playclip(AudioClip clip)
	{
		if (isPauseCalled && (bool)GetComponent<AudioSource>().clip)
		{
			isPauseCalled = false;
			GetComponent<AudioSource>().Play();
			return;
		}
		if (GetComponent<AudioSource>().isPlaying)
		{
			GetComponent<AudioSource>().Stop();
		}
		if ((bool)clip)
		{
			GetComponent<AudioSource>().clip = clip;
			GetComponent<AudioSource>().Play();
		}
	}

	public void Stop()
	{
		isPauseCalled = false;
		if (GetComponent<AudioSource>().isPlaying)
		{
			GetComponent<AudioSource>().Stop();
		}
	}

	public void SetVolume(float percent)
	{
		GetComponent<AudioSource>().volume = percent / 100f;
	}
}
