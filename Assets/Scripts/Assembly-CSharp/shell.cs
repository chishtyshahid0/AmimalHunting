using UnityEngine;

public class shell : MonoBehaviour
{
	public float waitTime = 2f;

	public AudioSource myAudioSource;

	public AudioClip[] shellsounds;

	private void Start()
	{
	}

	private void Update()
	{
	}

	private void OnCollisionEnter(Collision collision)
	{
		if (!myAudioSource.isPlaying)
		{
			myAudioSource.clip = shellsounds[Random.Range(0, shellsounds.Length)];
			myAudioSource.Play();
		}
	}
}
