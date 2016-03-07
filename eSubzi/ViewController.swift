//
//  ViewController.swift
//  eSubzi
//
//  Created by Robin Malhotra on 07/03/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters = ["shopKeeperId":0,"discountDescription":"sadkfhaksfnkasdfkasdjnfkasdf"]
        let headers = [
            "x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyIkX18iOnsic3RyaWN0TW9kZSI6dHJ1ZSwiZ2V0dGVycyI6e30sIndhc1BvcHVsYXRlZCI6ZmFsc2UsImFjdGl2ZVBhdGhzIjp7InBhdGhzIjp7Il9fdiI6ImluaXQiLCJlbWFpbCI6ImluaXQiLCJwYXNzd29yZCI6ImluaXQiLCJfaWQiOiJpbml0In0sInN0YXRlcyI6eyJpZ25vcmUiOnt9LCJkZWZhdWx0Ijp7fSwiaW5pdCI6eyJfX3YiOnRydWUsImVtYWlsIjp0cnVlLCJwYXNzd29yZCI6dHJ1ZSwiX2lkIjp0cnVlfSwibW9kaWZ5Ijp7fSwicmVxdWlyZSI6e319LCJzdGF0ZU5hbWVzIjpbInJlcXVpcmUiLCJtb2RpZnkiLCJpbml0IiwiZGVmYXVsdCIsImlnbm9yZSJdfSwiZW1pdHRlciI6eyJkb21haW4iOm51bGwsIl9ldmVudHMiOnt9LCJfZXZlbnRzQ291bnQiOjAsIl9tYXhMaXN0ZW5lcnMiOjB9fSwiaXNOZXciOmZhbHNlLCJfZG9jIjp7Il9fdiI6MCwiZW1haWwiOiJtYWxob3RyLnJvYmluQHlhaG9vLmNvLmluIiwicGFzc3dvcmQiOiIkMmEkMDgkLmRkM2g0Q3RhbUFQZENuaHguMDBvdWwuWFV6bnNIMFBDTXF3L1hnaTNHYXFrUy50MmFTZTIiLCJfaWQiOiI1NmQ3MmY0MjBmNzFjODE4MGIxMDUzZDUifSwiX3ByZXMiOnsiJF9fb3JpZ2luYWxfc2F2ZSI6W251bGwsbnVsbF19LCJfcG9zdHMiOnsiJF9fb3JpZ2luYWxfc2F2ZSI6W119LCJpYXQiOjE0NTczNTQ4ODUsImV4cCI6MTQ1NzQ0MTI4NX0.nhX4BWAq0SasszaRtSJpS-GERwO7pKZlYrWT274Dih4",
            "Content-Type": "application/x-www-form-urlencoded"
        ]

        Alamofire.request(.POST, "http://localhost:3000/api/discounts/create", parameters: parameters,headers:headers)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

