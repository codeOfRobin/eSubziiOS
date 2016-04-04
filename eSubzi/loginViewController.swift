//
//  loginViewController.swift
//  eSubzi
//
//  Created by Robin Malhotra on 10/03/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class loginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func login(sender: AnyObject)
    {
        let parameters = ["email":emailTextField.text!,"password":passwordTextField.text!]
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setNeedsStatusBarAppearanceUpdate()
        Alamofire.request(.POST, API().loginURL, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setValue(json["token"].string, forKeyPath: "token")
                    defaults.synchronize()
                    self.performSegueWithIdentifier("successLogin", sender: self)
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        if let _ = defaults.valueForKey("token")
        {
            self.performSegueWithIdentifier("successLogin", sender: self)

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        print("yay")
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
