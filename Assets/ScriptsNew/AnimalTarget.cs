using UnityEngine;

/// <summary>
/// Har animal prefab par lagao. Ye khud ko TargetIndicatorManager me register karta hai.
/// Animal mar jaye to Die() call karo (ya object disable/destroy ho jaye) - indicator khud hat jayega.
/// </summary>
public class AnimalTarget : MonoBehaviour
{
    [Tooltip("Indicator animal ke upar kitna high dikhe")]
    public Vector3 indicatorOffset = new Vector3(0f, 1.5f, 0f);

    [HideInInspector] public bool isDead;

    public Vector3 IndicatorWorldPosition => transform.position + indicatorOffset;

    void OnEnable()
    {
        isDead = false;
        TargetIndicatorManager.Register(this);
    }

    void OnDisable()
    {
        TargetIndicatorManager.Unregister(this);
    }

    // Animal ke health script se call karo jab animal mare
    public void Die()
    {
        isDead = true;
        TargetIndicatorManager.Unregister(this);
    }
}
