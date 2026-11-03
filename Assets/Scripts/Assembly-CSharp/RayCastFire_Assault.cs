using UnityEngine;

public class RayCastFire_Assault : MonoBehaviour
{
	public static RayCastFire_Assault myScript;

	public float force = 500f;

	public float damage = 50f;

	public float range = 100f;

	public LayerMask mask;

	public int projectilecount = 1;

	public float inaccuracy = 0.1f;

	[Header("Effect Region")]
	public GameObject impactnormal;

	public GameObject impactBlood;

	public GameObject BloodPart;

	public GameObject BloodPart2;

	[Header("Upgrade Values ")]
	public float mf_Range;

	public float mf_DamgeVal = 20f;

	private RaycastHit hit = default(RaycastHit);

	public RaycastHit Updatehit = default(RaycastHit);

	private LayerMask _mlayer = 11;

	public int mi_HeadShots;

	public int mi_LungShots;

	public int mi_BrainShots;

	public int mi_HeartShots;

	[SerializeField]
	private Camera aimCamera;

	private void Awake()
	{
		myScript = this;
       if (aimCamera == null)
		{
			aimCamera = Camera.main;
		}
	}

    //private void Update()
    //{
    //       Debug.DrawRay(Camera.main.transform.position, Camera.main.transform.forward * 500f, Color.red);
    //       //Debug.DrawRay(base.transform.position, base.transform.forward * 500f, Color.red);
    //       //if (!Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward * 500f, out Updatehit, 1000f))
    //       //{
    //       //}
    //   }

    private void Update()
    {
        if (aimCamera == null)
		{
			aimCamera = Camera.main;
		}

		if (aimCamera == null)
		{
			return;
		}

		Debug.DrawRay(aimCamera.transform.position, aimCamera.transform.forward * 500f, Color.red);

        if (Physics.Raycast(aimCamera.transform.position, aimCamera.transform.forward, out Updatehit, 500f))
        {
            //sDebug.Log("Hit: " + Updatehit.collider.name);
        }
    }

    private void fire()
	{
		for (int i = 0; i < projectilecount; i++)
		{
			firebullet();
		}
	}

	private void firebullet()
	{
		Vector3 forward = base.transform.forward;
		Vector3 up = base.transform.up;
		Vector3 right = base.transform.right;
		Vector3 vector = forward;
		vector += Random.Range(0f - inaccuracy, inaccuracy) * up + Random.Range(0f - inaccuracy, inaccuracy) * right;
		Debug.DrawRay(base.transform.position, vector, Color.red);
		Ray ray = new Ray(base.transform.position, vector);
		if (Physics.Raycast(ray, out hit, 500f) && hit.transform.tag == "Untagged")
		{
			GameObject gameObject = Object.Instantiate(impactnormal, hit.point, Quaternion.FromToRotation(Vector3.up, hit.normal));
			gameObject.transform.parent = hit.transform;
			gameObject.transform.name = "BulletShot";
		}
	}

	private void BulletFired(Vector3 posToMove)
	{
	}
}
