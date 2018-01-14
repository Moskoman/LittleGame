using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckPointFlag : MonoBehaviour {

    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.tag == "Player")
        {
            Debug.Log("Acabou a fase");
            GameObject.FindGameObjectWithTag("Player").GetComponent<Player>().DecreaseSpeedFlag();
        }
    }
}