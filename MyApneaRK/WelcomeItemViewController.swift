//
//  WelcomeItemViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/23/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class WelcomeItemViewController: UIViewController {
    
    var itemIndex = Int()
    var pageTitle = String()
    var pageSubtitle = String()

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = pageTitle
        subtitleLabel.text = pageSubtitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
}
