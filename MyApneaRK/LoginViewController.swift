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
    
    @IBAction func primaryActionSelected(sender: AnyObject) {
    }
    @IBAction func changePrimaryActionSelected(sender: AnyObject) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
