//
//  LoginViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/10/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // Form elements

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var primaryActionButton: UIButton!
    @IBOutlet var returnButton: UIButton!

    
    @IBAction func primaryActionSelected(sender: AnyObject) {
        var urlString = "https://staging.partners.org/myapnea.org"
        var params = ["user":["email":usernameTextField.text, "password":passwordTextField.text, "first_name":firstNameTextField.text, "last_name":lastNameTextField.text, "over_eighteen":"true"]]
        loginFromView(params, urlString: urlString)
    }
    
    @IBAction func returnButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Establish view
        let colorTop = UIColor(red: 35.0/255.0, green: 48.0/255.0, blue: 101.0/255.0, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 16.0/255.0, green: 104.0/255.0, blue: 199.0/255.0, alpha: 1.0).CGColor

        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorTop, colorBottom]
        gradient.locations = [0.0, 1.0]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let forumName = userDefaults.objectForKey("forumName") as? String {
            if !forumName.isEmpty {
                segueToTabbedController()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Control keyboard
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // Login
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
                    // Save relevant information to NSUserDefaults
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
        // Transition to main application
        segueToTabbedController()
    }
    
    func segueToTabbedController() {
        self.performSegueWithIdentifier("segueToTabbedAppFromSignUp", sender: self)
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
