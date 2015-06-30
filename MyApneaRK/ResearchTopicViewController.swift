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
    var researchTopicRating = Float()
    var researchTopicVoteCount = Int()
    
    @IBOutlet var votingView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var resultsView: UIView!
    @IBOutlet var endorsementValueLabel: UILabel!
    @IBOutlet var endorsementProgressView: UIProgressView!
    
    @IBAction func agreeButtonClicked(sender: AnyObject) {
        votingView.hidden = true
        resultsView.hidden = false
        updateEndorsementValue(researchTopicRating)
    }
    @IBAction func disagreeButtonClicked(sender: AnyObject) {
        votingView.hidden = true
        resultsView.hidden = false
        updateEndorsementValue(researchTopicRating)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsView.hidden = true
        titleLabel.text = researchTopicTitle
        descriptionLabel.text = researchTopicDescription
    }
    
    func updateEndorsementValue(value: Float) -> Void {
        let percentValue = value * 100.0
        endorsementValueLabel.text = "\(percentValue.description)%"
        endorsementProgressView.progress = value
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
