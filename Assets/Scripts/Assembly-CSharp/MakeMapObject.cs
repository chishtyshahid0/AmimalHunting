using UnityEngine;
using UnityEngine.UI;

public class MakeMapObject : MonoBehaviour
{
	public Image image;

    private void OnEnable()
    {
        MiniMapController.RegisterMapObject(base.gameObject, image);
    }

    //private void OnDestroy()
    //{
    //	MiniMapController.RemoveMapObject(base.gameObject);
    //}

    //private void OnDisable()
    //{
    //	MiniMapController.RemoveMapObject(base.gameObject);
    //}
}
