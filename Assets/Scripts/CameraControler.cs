using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControler : MonoBehaviour {

    public Transform player;
    public float smoothStep = 0.125f;
    public Vector3 offset;

    void LateUpdate ()
    {
        transform.position = player.position + offset;
    } 

}
