using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControler : MonoBehaviour {

    public Transform player;
    public float smoothStep = 0.125f;
    public Vector3 offset;

    void FixedUpdate ()
    {
        Vector3 desiredPosition = player.position + offset;
        Vector3 smoothedPosition = Vector3.Lerp(transform.position, desiredPosition, smoothStep);
        
        if (player.position.y + 2 > transform.position.y)
        {

        }
            transform.position = smoothedPosition;

    } 

}
