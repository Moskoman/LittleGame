﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckPointFlag : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.tag == "Player")
        {
            Debug.Log("Acabou a fase");
            GameObject.FindGameObjectWithTag("Player").GetComponent<Player>().DecreaseSpeedFlag();
        }
    }
}
