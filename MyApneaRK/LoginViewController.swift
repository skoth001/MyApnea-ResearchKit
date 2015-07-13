//
//  LoginViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/10/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Form elements

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var primaryActionButton: UIButton!
    @IBOutlet var secondaryActionButton: UIButton!
    @IBOutlet var secondaryActionLabel: UILabel!
    var primaryActionIsLogin = false
    
    @IBAction func primaryActionSelected(sender: AnyObject) {
        if primaryActionIsLogin {
            var urlString = "https://staging.partners.org/myapnea.org/login"
            var params = ["user":["email":usernameTextField.text, "password":passwordTextField.text]]
            loginFromView(params, urlString: urlString)
        } else {
            var urlString = "https://staging.partners.org/myapnea.org"
            var params = ["user":["email":usernameTextField.text, "password":passwordTextField.text, "first_name":firstNameTextField.text, "last_name":lastNameTextField.text, "over_eighteen":"true"]]
            loginFromView(params, urlString: urlString)
        }
    }
    
    @IBAction func changePrimaryActionSelected(sender: AnyObject) {
        if primaryActionIsLogin {
            primaryActionButton.setTitle("Sign Up", forState: UIControlState.Normal)
            secondaryActionButton.setTitle("Login", forState: UIControlState.Normal)
            secondaryActionLabel.text = "Already a member?"
            firstNameTextField.hidden = false
            lastNameTextField.hidden = false
            primaryActionIsLogin = false
        } else {
            primaryActionButton.setTitle("Login", forState: UIControlState.Normal)
            secondaryActionButton.setTitle("Sign Up", forState: UIControlState.Normal)
            secondaryActionLabel.text = "Not a member yet?"
            firstNameTextField.hidden = true
            lastNameTextField.hidden = true
            primaryActionIsLogin = true
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginFromView(params: NSDictionary, urlString: String) {
        var request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        // Set params based on input
        println(params)
        
        // Add request params and headers
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        println(request)
        
        // Create task
        var task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            if err != nil {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("ERROR could not parse JSON: \(jsonStr)")
            } else {
                if let parseJSON = json {
                    var success = parseJSON["success"] as? Int
                    println("Success: \(success)")
                    var forumName = parseJSON["forum_name"] as? String
                    if forumName != nil {
                        let userDefaults = NSUserDefaults.standardUserDefaults()
                        userDefaults.setValue(forumName, forKey: "forumName")
                        userDefaults.synchronize()
                    }
                } else {
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("ERROR could not parse JSON: \(jsonStr)")
                }
            }
            
        })
        task.resume()
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
