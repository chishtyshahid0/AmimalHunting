using UnityEngine;

public class PingPong : MonoBehaviour
{
	public float X = 1.3f;

	public float Y = 1.3f;

	public float time = 0.3f;

	public float startAfter;

	public iTween.EaseType effectType;

	private void OnEnable()
	{
		Invoke("TweenIn", startAfter);
	}

	private void TweenIn()
	{
		iTween.ScaleBy(base.gameObject, iTween.Hash("x", X, "y", Y, "time", time, "loopType", iTween.LoopType.pingPong, "islocal", true, "easeType", effectType));
	}
}
