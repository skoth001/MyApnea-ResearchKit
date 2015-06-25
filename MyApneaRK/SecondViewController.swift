//
//  SecondViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/24/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit
import ResearchKit
import ResearchKit.Private
import WebKit

class SecondViewController: UITableViewController, UITableViewDelegate {
    
    var surveys = ["About Me", "Additional Information", "My Sleep Pattern", "About My Family", "My Sleep Quality", "My Health Conditions", "My Quality of Life", "My Sleep Apnea", "My Sleep Apnea Treatment", "My Risk Profile", "My Interest in Research"]
    var tasks = [AboutMeSurveyTask, AdditionalInformationSurveyTask, MySleepPatternSurveyTask, AboutMyFamilySurveyTask, MySleepQualitySurveyTask, MyHealthConditionsSurveyTask, MyQualityOfLifeSurveyTask, MySleepApneaSurveyTask, MySleepApneaTreatmentSurveyTask, MyRiskProfileSurveyTask, MyInterestInResearchSurveyTask]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return surveys.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "SurveyCell")
        cell.textLabel?.text = surveys[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let taskViewController = ORKTaskViewController(task: tasks[indexPath.row], taskRunUUID: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first! as? NSURL
        presentViewController(taskViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension SecondViewController : ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
}