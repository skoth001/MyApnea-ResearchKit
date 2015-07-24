//
//  SurveyCollectionViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/24/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit
import ResearchKit
import ResearchKit.Private
import WebKit

let reuseIdentifier = "SurveyCell"

class SurveyCollectionViewController: UICollectionViewController {
    
    // Surveys
    var surveyNames = ["About Me", "Additional Information", "About My Family", "Risk Profile", "My Sleep Pattern", "My Sleep Quality", "My Sleep Apnea", "My Sleep Treatment", "My Quality of Life", "My Health Conditions", "My Interest in Research"]
    let surveyImages = ["about_me.jpg", "additional_info.jpg", "about_family.jpg", "risk_profile.jpg", "sleep_pattern.jpg", "sleep_quality.jpg", "sleep_apnea.jpg", "sleep_treatment.jpg", "quality_of_life.jpg", "health_conditions.jpg", "interest_in_research.jpg"]
    let surveyImagesFinished = ["about_me_finished.jpg", "additional_info_finished.jpg", "about_family_finished.jpg", "risk_profile_finished.jpg", "sleep_pattern_finished.jpg", "sleep_quality_finished.jpg", "sleep_apnea_finished.jpg", "sleep_treatment_finished.jpg", "quality_of_life_finished.jpg", "health_conditions_finished.jpg", "interest_in_research_finished.jpg"]
    var tasks = [AboutMeSurveyTask, AdditionalInformationSurveyTask, AboutMyFamilySurveyTask, MyRiskProfileSurveyTask, MySleepPatternSurveyTask, MySleepQualitySurveyTask, MySleepApneaSurveyTask, MySleepApneaTreatmentSurveyTask, MyQualityOfLifeSurveyTask, MyHealthConditionsSurveyTask, MyInterestInResearchSurveyTask]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return surveyImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
    
        cell.backgroundColor = UIColor.clearColor()
        
        // Configure the cell via completion
        var surveyImageName = String()
        var r = Float(arc4random()) / Float(UINT32_MAX)
        if r > 0.60 {
            surveyImageName = surveyImagesFinished[indexPath.row]
        } else {
            surveyImageName = surveyImages[indexPath.row]
        }
        println(surveyImageName)
        
        let surveyImage = UIImageView()
        surveyImage.frame = cell.bounds
        surveyImage.image = UIImage(named: surveyImageName)
        cell.insertSubview(surveyImage, atIndex: 1)
    
        return cell
    }
    
    // MARK: UICollectionViewCell Layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = (self.view.frame.width - 30) / 2
        let surveyCellSize = CGSizeMake(cellWidth, cellWidth)
        return surveyCellSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        println(surveyNames[indexPath.row])
        let taskViewController = ORKTaskViewController(task: tasks[indexPath.row], taskRunUUID: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first! as? NSURL
        presentViewController(taskViewController, animated: true, completion: nil)
        
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}

extension SurveyCollectionViewController : ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
}