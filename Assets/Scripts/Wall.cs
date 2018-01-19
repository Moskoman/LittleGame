
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Wall : MonoBehaviour {

    private bool playerIsDashing;

    private void OnCollisionEnter(Collision collision)
    {
         if (collision.gameObject.tag == "Player")
        {
            playerIsDashing = GameObject.FindGameObjectWithTag("Player").GetComponent<Player>().isDashing;
            if (playerIsDashing == true)
                {
                Destroy(this.gameObject);
            }
            else
            {
                GameObject.FindGameObjectWithTag("Player").GetComponent<Player>().Die();
                Destroy(this.gameObject);
            }
        }
    }
}
