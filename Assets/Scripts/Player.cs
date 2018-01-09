using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {

    public int moveSpeed = 30;
    public float jumpForce = 30;
    public float dashForce = 20;
    public bool isDashing = false;
    public bool isAlive = true;
    private bool canDash = true;
    private float dashCoolDown = 2f;
    private float dashCoolDownTimeStamp = 0;
    private Vector3 jumpForceVector;
    private Camera camera;
    private Vector3 dashForceVector;
    
    public Rigidbody playerRigidbody;

    // Use this for initialization
    void Start () {

        isDashing = false;
        playerRigidbody = GetComponent<Rigidbody>();
        jumpForceVector = new Vector3(0, jumpForce, 0);
        dashForceVector = new Vector3(dashForce, 0, 0);
        camera = GetComponent<Camera>();
    }
	
	// Update is called once per frame
	void Update () {

        CheckDeath();
        if (isAlive)
        {
            CheckCoolDown();
            CheckInput();
            Move();
        }
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

        if ((canDash == true) && (Input.GetKeyDown(KeyCode.LeftShift)))
        {
            Dash();
        }
    }

    private void Jump ()
    {

        playerRigidbody.AddForce(jumpForceVector, ForceMode.Impulse);
    }

    private void Dash ()
    {
        playerRigidbody.AddForce(dashForceVector, ForceMode.Impulse);
        isDashing = true;
        dashCoolDownTimeStamp = Time.time;
        canDash = false;

    }

    public bool IsGrounded ()
    {
        if (Mathf.Abs (playerRigidbody.velocity.y) <= 0.1f) {
            return true;
        }
        return false;
    }

    private void CheckCoolDown ()
    {
        if (dashCoolDownTimeStamp + dashCoolDown <= Time.time)
        {
            canDash = true;
        }
    }

    private void CheckDeath ()
    {
        if (transform.position.x < camera.transform.position.x)
        {
            isAlive = false;
        }
    }
}
