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
//        let defaults = NSUserDefaults.standardUserDefaults()
//        let token = defaults.valueForKey("token") as! String
//        let headers = [
//            "x-access-token": token,
//            "Content-Type": "application/x-www-form-urlencoded"
//        ]
//        let items = [["1":3],["2341ewasdx":4]]
//        Alamofire.request(.POST, "http://localhost:3000/api/discounts/create", parameters: ["items":items],headers:headers)
//            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

