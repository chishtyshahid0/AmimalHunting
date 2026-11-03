using UnityEngine;

public class MaterialOffset : MonoBehaviour
{
	public float scrollSpeed = 0.5f;

	public Renderer rampRenderer;

	private void Start()
	{
		rampRenderer = GetComponent<Renderer>();
	}

	private void Update()
	{
		float x = Time.time * scrollSpeed;
		rampRenderer.material.SetTextureOffset("_MainTex", new Vector2(x, 0f));
	}
}
