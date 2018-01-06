using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {

    public int moveSpeed = 10;
    public Vector3 jumpForce = new Vector3 (0, 10, 0);
    public Rigidbody playerRigidbody;

    // Use this for initialization
    void Start () {

        playerRigidbody = GetComponent<Rigidbody>();
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
            if (IsGrounded())
            {
                Jump();
            }
        }
    }

    private void Jump ()
    {

        playerRigidbody.AddForce(jumpForce, ForceMode.Impulse);
    }

    public bool IsGrounded ()
    {
        if (Mathf.Abs (playerRigidbody.velocity.y) <= 0.1f) {
            return true;
        }
        return false;
    }

}
