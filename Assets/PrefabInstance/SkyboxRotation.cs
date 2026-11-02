
using UnityEngine;

public class SkyboxRotation : MonoBehaviour
{
    [Header("Skybox Rotation Settings")]
    public float rotationSpeed = 2f;

    private Material skyboxMaterial;

    void Start()
    {
        if (RenderSettings.skybox == null)
        {
            Debug.LogError("Skybox Material assign nahi hai!");
            enabled = false;
            return;
        }

        // Skybox material ki apni copy banao
        skyboxMaterial = new Material(RenderSettings.skybox);
        RenderSettings.skybox = skyboxMaterial;
    }

    void Update()
    {
        if (skyboxMaterial == null)
            return;

        float rotation = skyboxMaterial.GetFloat("_Rotation");

        rotation += rotationSpeed * Time.deltaTime;

        if (rotation >= 360f)
            rotation -= 360f;

        skyboxMaterial.SetFloat("_Rotation", rotation);
    }

    private void OnDestroy()
    {
        if (skyboxMaterial != null)
            Destroy(skyboxMaterial);
    }
}
