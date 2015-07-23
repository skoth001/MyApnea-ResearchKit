//
//  WelcomePageViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/23/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background
        let colorTop = UIColor(red: 35.0/255.0, green: 48.0/255.0, blue: 101.0/255.0, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 16.0/255.0, green: 104.0/255.0, blue: 199.0/255.0, alpha: 1.0).CGColor
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorTop, colorBottom]
        gradient.locations = [0.0, 1.0]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
