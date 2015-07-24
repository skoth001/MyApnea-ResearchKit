//
//  TabBarController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/24/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        // Set background
        let colorTop = UIColor(red: 255.0/255.0, green: 164.0/255.0, blue: 0.0/255.0, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 247.0/255.0, green: 107.0/255.0, blue: 28.0/255.0, alpha: 1.0).CGColor
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorTop, colorBottom]
        gradient.locations = [0.0, 1.0]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
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
