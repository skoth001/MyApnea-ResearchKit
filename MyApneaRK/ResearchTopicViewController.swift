//
//  ResearchTopicViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/30/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class ResearchTopicViewController: UIViewController {
    
    var researchTopicTitle = String()
    var researchTopicDescription = String()
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = researchTopicTitle
        descriptionLabel.text = researchTopicDescription
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
