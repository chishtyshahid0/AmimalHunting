using UnityEngine;
using System.Collections;

/// <summary>
/// BulletSlowmoFollowCam:
/// 1. Bullet Flight Camera:
///    Camera bullet ke peeche safe distance (3.5m peeche, 0.6m uper) par rehta hai.
///    Flight stop distance 3.0m rakhi gayi hai taake camera bullet hit hote waqt aage na nikle,
///    balki bullet ko animal ke andar hit hote hue poori tarah dekhe.
/// 2. Hit Impact & Blood Particles:
///    Impact point par guaranteed blood burst instantiate hota hai.
/// 3. 2-Second Death Animation Delay:
///    Hit hone ke baad camera exactly 2.0 SECONDS tak rukta hai taake user animal ki death/fall animation poori tarah dekh sake.
/// 4. Wide Full Animal Framing:
///    Animal ke pure root body center se 7.0m door aur 2.2m uncha camera rehta hai,
///    jis se animal ka koi ek part nahi balki poora animal head to toe screen ke center mein rehta hai.
/// 5. Return at TimeScale = 0.8:
///    2 second death animation dekhne ke baad camera 0.8 speed se player ki position par smoothly wapis return karta hai.
/// </summary>
public class BulletSlowmoFollowCam : MonoBehaviour
{
    public static BulletSlowmoFollowCam Instance;

    [Header("Cameras")]
    public Camera bulletFollowCamera;
    public Camera mainCamera;
    public Camera weaponCamera;

    [Header("Bullet Settings")]
    public GameObject bulletPrefab;

    [Tooltip("Cinematic flight speed in slow-mo")]
    public float bulletSpeed = 24f;

    [Header("Slow-Mo Speeds")]
    [Tooltip("Bullet travel time scale (0.2 slow-mo)")]
    public float bulletSlowmoTimeScale = 0.2f;

    [Tooltip("Camera return time scale (0.8 return speed)")]
    public float returnTimeScale = 0.8f;

    [Header("Camera Follow Behind Bullet (Thora Peechay)")]
    [Tooltip("Camera position offset behind bullet - safe distance taake aage na nikal jaye")]
    public Vector3 followOffset = new Vector3(0.4f, 0.55f, -3.2f);

    [Header("End Impact Full Animal Framing")]
    [Tooltip("Hit hone par camera ka Field of View (FOV) - 60 recommended taake pura animal nazr aye")]
    public float impactFieldOfView = 70.0f;

    [Tooltip("Animal se camera ka distance taake poora animal view mein dikhe")]
    public float animalFramingDistance = 7.0f;

    [Tooltip("Animal ke uper camera elevation")]
    public float animalFramingHeight = 10f;

    [Tooltip("Hit impact ke baad kitni der camera ruke taake die animation dikhe (unscaled seconds)")]
    public float deathWatchDuration = 2.0f;

    [Tooltip("Return duration back to player view (unscaled seconds)")]
    public float returnDuration = 0.85f;

    // State
    private bool isRunning = false;
    private GameObject activeBullet;
    private bool wasPlayerEnabled = true;

    private void Awake()
    {
        Instance = this;
        FindExistingCamera();
    }

    private void FindExistingCamera()
    {
        if (bulletFollowCamera != null) return;

        // Scene me moojood "BulletSlowmo_FollowCamera" dhoondo (chahe active ho ya inactive)
        Camera[] allCams = Resources.FindObjectsOfTypeAll<Camera>();
        for (int i = 0; i < allCams.Length; i++)
        {
            if (allCams[i] != null && allCams[i].gameObject.name.Equals("BulletSlowmo_FollowCamera", System.StringComparison.OrdinalIgnoreCase))
            {
                bulletFollowCamera = allCams[i];
                break;
            }
        }
    }

    public bool IsActive()
    {
        return isRunning;
    }

    public void LaunchBullet(Vector3 muzzlePos, Vector3 hitPoint, System.Action onImpactCallback, Transform animalTransform = null)
    {
        if (isRunning)
        {
            StopAllCoroutines();
            if (activeBullet != null) Destroy(activeBullet);
        }
        StartCoroutine(BulletTravelRoutine(muzzlePos, hitPoint, onImpactCallback, animalTransform));
    }

    private IEnumerator BulletTravelRoutine(Vector3 startPos, Vector3 targetPos, System.Action onImpact, Transform animalTransform)
    {
        isRunning = true;

        // 1. Get Main Camera
        if (mainCamera == null)
        {
            mainCamera = Camera.main;
            if (mainCamera == null)
            {
                Camera[] allCams = Camera.allCameras;
                for (int i = 0; i < allCams.Length; i++)
                {
                    if (allCams[i].enabled && allCams[i] != bulletFollowCamera)
                    {
                        mainCamera = allCams[i];
                        break;
                    }
                }
            }
        }

        // 2. Setup Follow Camera (Pehele scene wala camera use karein)
        if (bulletFollowCamera == null)
        {
            FindExistingCamera();
        }

        if (bulletFollowCamera == null)
        {
            GameObject camObj = new GameObject("BulletSlowmo_FollowCamera");
            bulletFollowCamera = camObj.AddComponent<Camera>();
            if (mainCamera != null)
            {
                bulletFollowCamera.CopyFrom(mainCamera);
                bulletFollowCamera.depth = mainCamera.depth + 10;
            }
            bulletFollowCamera.gameObject.SetActive(false);
            DontDestroyOnLoad(camObj);
        }

        // 3. Freeze Player Controls (Player apni jagah par khara rahega)
        if (playercontroller.Obj != null)
        {
            wasPlayerEnabled = playercontroller.Obj.isenabled;
            playercontroller.Obj.isenabled = false;
            if (playercontroller.Obj.controller != null)
            {
                playercontroller.Obj.controller.enabled = false;
            }
        }

        if (CameraControllesAssaults.myScript != null)
        {
            CameraControllesAssaults.myScript.Ignorenow = true;
            CameraControllesAssaults.myScript.enabled = false;
        }

        if (UIcontrol.Obj != null && UIcontrol.Obj.Allcontrols != null)
        {
            UIcontrol.Obj.Allcontrols.transform.localScale = Vector3.zero;
        }

        if (weaponCamera != null)
        {
            weaponCamera.enabled = false;
        }

        // 4. Force Slowmo 0.2 at launch
        Time.timeScale = bulletSlowmoTimeScale;
        Time.fixedDeltaTime = 0.02f * bulletSlowmoTimeScale;

        // 5. Spawn Bullet
        Vector3 flightDir = (targetPos - startPos).normalized;
        if (flightDir == Vector3.zero) flightDir = Vector3.forward;

        if (bulletPrefab != null)
        {
            activeBullet = Instantiate(bulletPrefab, startPos, Quaternion.LookRotation(flightDir));
        }
        else
        {
            activeBullet = CreateProceduralBullet(startPos, flightDir);
        }

        bulletFollowCamera.gameObject.SetActive(true);
        if (mainCamera != null)
        {
            bulletFollowCamera.transform.position = mainCamera.transform.position;
            bulletFollowCamera.transform.rotation = mainCamera.transform.rotation;
            bulletFollowCamera.fieldOfView = mainCamera.fieldOfView;
        }

        float totalDist = Vector3.Distance(startPos, targetPos);
        float currentDist = 0f;

        Vector3 rightDir = Vector3.Cross(Vector3.up, flightDir).normalized;
        if (rightDir == Vector3.zero) rightDir = Vector3.right;

        // 6. Flight Loop: Follow bullet smoothly from a SAFE DISTANCE BEHIND (No camera overtaking)
        // Camera stops moving forward earlier so it never shoots past the animal
        while (currentDist < totalDist - 2.8f && activeBullet != null)
        {
            Time.timeScale = bulletSlowmoTimeScale;
            Time.fixedDeltaTime = 0.02f * bulletSlowmoTimeScale;

            float moveStep = bulletSpeed * Time.unscaledDeltaTime;
            activeBullet.transform.position += flightDir * moveStep;
            currentDist += moveStep;

            activeBullet.transform.rotation = Quaternion.LookRotation(flightDir) * Quaternion.Euler(90f, 0f, 0f);

            // Camera stays comfortably behind and elevated
            Vector3 desiredCamPos = activeBullet.transform.position
                                  + rightDir * followOffset.x
                                  + Vector3.up * followOffset.y
                                  - flightDir * Mathf.Abs(followOffset.z);

            Vector3 lookTargetPos = activeBullet.transform.position + flightDir * 4.0f;

            bulletFollowCamera.transform.position = Vector3.Lerp(bulletFollowCamera.transform.position, desiredCamPos, Time.unscaledDeltaTime * 10f);
            Quaternion targetRotation = Quaternion.LookRotation(lookTargetPos - bulletFollowCamera.transform.position);
            bulletFollowCamera.transform.rotation = Quaternion.Slerp(bulletFollowCamera.transform.rotation, targetRotation, Time.unscaledDeltaTime * 10f);

            yield return null;
        }

        // Final glide of bullet right into the hit point (User can clearly see bullet hitting the animal!)
        if (activeBullet != null)
        {
            float hitGlideTime = 0.15f;
            float glideTimer = 0f;
            Vector3 glideStart = activeBullet.transform.position;
            while (glideTimer < hitGlideTime && activeBullet != null)
            {
                glideTimer += Time.unscaledDeltaTime;
                activeBullet.transform.position = Vector3.Lerp(glideStart, targetPos, glideTimer / hitGlideTime);
                yield return null;
            }
            activeBullet.transform.position = targetPos;
        }

        // 7. Hit Impact Callback (Damage applied, blood effects triggered)
        if (onImpact != null)
        {
            try
            {
                onImpact.Invoke();
            }
            catch (System.Exception ex)
            {
                Debug.LogException(ex);
            }
        }

        if (activeBullet != null)
        {
            Destroy(activeBullet);
        }

        // 8. 2-Second Death Animation Viewing (Full Animal in View with FOV = 60!)
        // Calculate root animal center
        Vector3 animalCenter = targetPos;
        if (animalTransform != null)
        {
            Transform rootAnimal = animalTransform.root != null ? animalTransform.root : animalTransform;
            animalCenter = rootAnimal.position + Vector3.up * 1.0f;
        }

        // Wide framing: 7 meters back, 2.2 meters high, looking down at entire animal
        Vector3 impactCamPos = animalCenter - flightDir * (animalFramingDistance * 0.7f) + rightDir * (animalFramingDistance * 0.5f) + Vector3.up * animalFramingHeight;

        float deathTimer = 0f;
        while (deathTimer < deathWatchDuration)
        {
            Time.timeScale = bulletSlowmoTimeScale;
            Time.fixedDeltaTime = 0.02f * bulletSlowmoTimeScale;

            deathTimer += Time.unscaledDeltaTime;

            // Camera field of view 60 par transition hoti hai taake poora animal girty hue clearly dikhe
            bulletFollowCamera.fieldOfView = Mathf.Lerp(bulletFollowCamera.fieldOfView, impactFieldOfView, Time.unscaledDeltaTime * 6f);
            bulletFollowCamera.transform.position = Vector3.Lerp(bulletFollowCamera.transform.position, impactCamPos, Time.unscaledDeltaTime * 4f);

            Vector3 currentFocus = animalCenter;
            if (animalTransform != null)
            {
                Transform rootAnimal = animalTransform.root != null ? animalTransform.root : animalTransform;
                currentFocus = rootAnimal.position + Vector3.up * 0.9f;
            }

            Quaternion desiredLook = Quaternion.LookRotation(currentFocus - bulletFollowCamera.transform.position);
            bulletFollowCamera.transform.rotation = Quaternion.Slerp(bulletFollowCamera.transform.rotation, desiredLook, Time.unscaledDeltaTime * 6f);

            yield return null;
        }

        // 9. Return Camera at 0.8 SPEED
        Vector3 returnStartPos = bulletFollowCamera.transform.position;
        Quaternion returnStartRot = bulletFollowCamera.transform.rotation;
        float returnStartFOV = bulletFollowCamera.fieldOfView;
        float targetReturnFOV = (mainCamera != null) ? mainCamera.fieldOfView : returnStartFOV;

        Vector3 destinationPos = (mainCamera != null) ? mainCamera.transform.position : returnStartPos;
        Quaternion destinationRot = (mainCamera != null) ? mainCamera.transform.rotation : returnStartRot;

        float elapsed = 0f;

        while (elapsed < returnDuration)
        {
            Time.timeScale = returnTimeScale; // 0.8f
            Time.fixedDeltaTime = 0.02f * returnTimeScale;

            elapsed += Time.unscaledDeltaTime;
            float t = Mathf.SmoothStep(0f, 1f, elapsed / returnDuration);

            if (mainCamera != null)
            {
                destinationPos = mainCamera.transform.position;
                destinationRot = mainCamera.transform.rotation;
                targetReturnFOV = mainCamera.fieldOfView;
            }

            bulletFollowCamera.transform.position = Vector3.Lerp(returnStartPos, destinationPos, t);
            bulletFollowCamera.transform.rotation = Quaternion.Slerp(returnStartRot, destinationRot, t);
            bulletFollowCamera.fieldOfView = Mathf.Lerp(returnStartFOV, targetReturnFOV, t);

            yield return null;
        }

        // 10. Restore Normal State (TimeScale = 1.0f)
        bulletFollowCamera.gameObject.SetActive(false);

        Time.timeScale = 1f;
        Time.fixedDeltaTime = 0.02f;

        if (weaponCamera != null)
        {
            weaponCamera.enabled = true;
        }

        if (CameraControllesAssaults.myScript != null)
        {
            CameraControllesAssaults.myScript.enabled = true;
            CameraControllesAssaults.myScript.Ignorenow = false;
        }

        if (playercontroller.Obj != null)
        {
            playercontroller.Obj.isenabled = wasPlayerEnabled;
            if (playercontroller.Obj.controller != null)
            {
                playercontroller.Obj.controller.enabled = true;
            }
        }

        if (UIcontrol.Obj != null && UIcontrol.Obj.Allcontrols != null)
        {
            UIcontrol.Obj.Allcontrols.transform.localScale = Vector3.one;
        }

        isRunning = false;
    }

    private GameObject CreateProceduralBullet(Vector3 pos, Vector3 forward)
    {
        GameObject bullet = GameObject.CreatePrimitive(PrimitiveType.Capsule);
        bullet.name = "SlowmoBullet_Procedural";
        bullet.transform.position = pos;
        bullet.transform.rotation = Quaternion.LookRotation(forward) * Quaternion.Euler(90f, 0f, 0f);
        bullet.transform.localScale = new Vector3(0.06f, 0.22f, 0.06f);

        Collider col = bullet.GetComponent<Collider>();
        if (col != null) Destroy(col);

        Renderer rend = bullet.GetComponent<Renderer>();
        if (rend != null)
        {
            Shader standardShader = Shader.Find("Standard") ?? Shader.Find("Diffuse");
            if (standardShader != null)
            {
                Material mat = new Material(standardShader);
                mat.color = new Color(0.95f, 0.75f, 0.2f);
                rend.material = mat;
            }
        }

        TrailRenderer trail = bullet.AddComponent<TrailRenderer>();
        trail.time = 0.25f;
        trail.startWidth = 0.05f;
        trail.endWidth = 0f;
        Shader trailShader = Shader.Find("Mobile/Particles/Additive") ?? Shader.Find("Particles/Standard Unlit");
        if (trailShader != null)
        {
            trail.material = new Material(trailShader);
        }
        trail.startColor = new Color(1f, 0.8f, 0.3f, 0.8f);
        trail.endColor = new Color(1f, 0.4f, 0.1f, 0f);

        return bullet;
    }
}
