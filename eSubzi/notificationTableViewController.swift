//
//  notificationTableViewController.swift
//  eSubzi
//
//  Created by Robin Malhotra on 10/03/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class notificationTableViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var notifications : [JSON] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let defaults = NSUserDefaults.standardUserDefaults()
        let token = defaults.valueForKey("token") as! String
        let headers = [
            "x-access-token": token,
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        Alamofire.request(.GET, API().getAllNotificationsURL, headers:headers ).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json)")
                    self.notifications = json.array!
                    self.tableView.reloadData()
                }
            case .Failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return notifications.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        if indexPath.row%2==0
        {
            cell.textLabel?.text = "Safal"
        }
        else
        {
            cell.textLabel?.text = "Mother Dairy"
        }
        cell.detailTextLabel?.text = notifications[indexPath.row]["discountDescription"].string
        cell.textLabel?.numberOfLines = 0
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
