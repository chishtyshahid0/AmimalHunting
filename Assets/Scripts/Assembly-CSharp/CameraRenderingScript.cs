using UnityEngine;

public class CameraRenderingScript : MonoBehaviour
{
	private void Start()
	{
		float[] array = new float[32];
		array[8] = 250f;
		Camera.main.layerCullDistances = array;
	}
}
