using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
//using Boo.Lang;
using UnityEngine;

[Serializable]
public class RandomSound : MonoBehaviour
{
	//[Serializable]
	//[CompilerGenerated]
	//internal sealed class _0024PlaySounds_00241 : GenericGenerator<WaitForSeconds>
	//{
	//	internal RandomSound _0024self__00243;

	//	public _0024PlaySounds_00241(RandomSound self_)
	//	{
	//		_0024self__00243 = self_;
	//	}

	//	public override IEnumerator<WaitForSeconds> GetEnumerator()
	//	{
	//		return new _0024(_0024self__00243);
	//	}
	//}

	public AudioClip[] bulletSounds;

	public float audioRicochetteLength;

	public RandomSound()
	{
		audioRicochetteLength = 0.2f;
	}

	public  void Start()
	{
		StartCoroutine(PlaySounds());
	}

	public  IEnumerator PlaySounds()
	{
        return null;
		//return new _0024PlaySounds_00241(this).GetEnumerator();
	}

	public  void Main()
	{
	}
}
