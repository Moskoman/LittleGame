using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {

    public int moveSpeed = 10;
    public Rigidbody playerRigidbody;
    private bool isGrounded;

    // Use this for initialization
    void Start () {

        playerRigidbody = GetComponent<Rigidbody>();
        isGrounded = true;
    }
	
	// Update is called once per frame
	void Update () {

        CheckInput();
        Move();
		
	}

    private void Move () {

        playerRigidbody.MovePosition (transform.position + new Vector3 (moveSpeed * Time.deltaTime, 0, 0));

    }

    private void CheckInput()
    {
        if (Input.GetKeyDown("space"))
        {
            if (isGrounded)
            {
                Debug.Log("xubariba");
            }
        }
    }

}
