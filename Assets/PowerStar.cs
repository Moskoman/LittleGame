using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerStar : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnTriggerEnter(Collider collider)
    {
        Debug.Log("Pegou estrela");
        Destroy(this.gameObject);
    }
}
