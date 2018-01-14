using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerStar : MonoBehaviour {

    private void OnTriggerEnter(Collider collider)
    {
        GameObject.FindGameObjectWithTag("Player").GetComponent<Player>().powerStarCounter++;
        Destroy(this.gameObject);
    }
}
