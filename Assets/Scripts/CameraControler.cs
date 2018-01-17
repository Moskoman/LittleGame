using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControler : MonoBehaviour {

    public Transform player;
    public float smoothStep = 0.125f;
    public Vector3 offset;
    private Vector3 desiredPosition;

    void FixedUpdate ()
    {
        if (CheckFollowPlayerY())
        {
            desiredPosition = player.position + offset;
        }

        else
        {
            desiredPosition = player.position + offset;
            float newCameraY = Mathf.Lerp(transform.position.y, desiredPosition.y, smoothStep);
            desiredPosition = new Vector3(desiredPosition.x, newCameraY, desiredPosition.z);
        }

        Vector3 smoothedPosition = Vector3.Lerp(transform.position, desiredPosition, smoothStep);
        transform.position = smoothedPosition;

    }

    private bool CheckFollowPlayerY() {
        if (player.position.y > transform.position.y + 1 || player.position.y < transform.position.y - 3)
        {
            return true;
        }
        return false;
    }

}
