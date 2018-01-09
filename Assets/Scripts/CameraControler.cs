using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControler : MonoBehaviour {

    public Camera camera;
    public GameObject player;

    // Use this for initialization
	void Start () {

        camera = GetComponent<Camera>();
        player = GameObject.FindGameObjectWithTag("Player");

	}
	
	// Update is called once per frame
	void Update () {

        FollowPlayer();
	}

    public void FollowPlayer ()
    {
        Vector3 playerPosition = player.transform.position;
        camera.transform.position = new Vector3(playerPosition.x + 10, playerPosition.y + 1, -13);
    }

}
