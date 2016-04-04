//
//  OrderViewController.swift
//  eSubzi
//
//  Created by Robin Malhotra on 04/04/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class OrderViewController: UIViewController {

    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var currentStatusLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var products = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let token = defaults.valueForKey("token") as! String
        let headers = [
            "x-access-token": token,
            "Content-Type": "application/x-www-form-urlencoded"
        ]

        Alamofire.request(.POST, API().fetchOrdersURL, headers:headers,parameters:["usertype":"Customer"] ).validate().responseJSON { response in
            switch response.result
            {
            case .Success:
                if let value = response.result.value
                {
                    let json = JSON(value)
                    print(json)
                    sharedCurrentOrder.currentOrderState = orderState.InProgress
                    self.currentStatusLabel.text = "Current Status : \(json["Orders"][0]["currentState"].string!)"
                }
            case .Failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool)
    {
//        products = Array(sharedCurrentOrder.orders.keys)
    }
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return products.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
//        
//        
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
