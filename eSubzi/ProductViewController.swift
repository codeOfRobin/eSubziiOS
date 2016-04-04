//
//  ProductViewController.swift
//  eSubzi
//
//  Created by Robin Malhotra on 04/04/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ProductViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var products : [Product] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sharedCurrentOrder.currentOrderState = .haventOrdered
        tableView.delegate = self
        tableView.dataSource = self
        let defaults = NSUserDefaults.standardUserDefaults()
        let token = defaults.valueForKey("token") as! String
        let headers = [
            "x-access-token": token,
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        Alamofire.request(.GET, API().getAllProductsURL, headers:headers ).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    if let prodArray = json.array
                    {
                        self.products = prodArray.map({ (jsonObj) -> Product in
                            return Product(jsonDict: jsonObj)
                        })
                    }
                    print(self.products.count)
                    self.tableView.reloadData()
                } 
            case .Failure(let error):
                print(error)
            }
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.products.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ProductTableViewCell
        cell.setDataFromProduct(products[indexPath.row])
        return cell
    }
    
    
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
