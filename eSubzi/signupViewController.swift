import UIKit
import Alamofire
import SwiftyJSON


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUp(sender: AnyObject)
    {
        let parameters = ["email":emailTextField.text!,"password":passwordTextField.text!]
        print(passwordTextField.text)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setNeedsStatusBarAppearanceUpdate()
        Alamofire.request(.POST, API().signupURL, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setValue(json["token"].string, forKeyPath: "token")
                    defaults.synchronize()
                    self.performSegueWithIdentifier("successSignUp", sender: self)
                }
            case .Failure(let error):
                print(NSString(data: response.data!, encoding: NSUTF8StringEncoding))
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
            self.performSegueWithIdentifier("successSignUp", sender: self)
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
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
