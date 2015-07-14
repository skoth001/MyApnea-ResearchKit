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
    var researchTopicId = Int()
    var userHasVoted = Bool()
    
    @IBOutlet var votingView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var resultsView: UIView!
    @IBOutlet var endorsementValueLabel: UILabel!
    @IBOutlet var endorsementProgressView: UIProgressView!
    
    @IBAction func agreeButtonClicked(sender: AnyObject) {
        votingView.hidden = true
        resultsView.hidden = false
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let params = ["user_forum_name":userDefaults.objectForKey("forumName") as! String,"research_topic_id":researchTopicId.description, "endorse":"1"]
        let urlString = "https://staging.partners.org/myapnea.org/api/research-topics/vote.json"
        voteFromView(params, urlString: urlString)
        updateEndorsementValue(researchTopicRating)
    }
    @IBAction func disagreeButtonClicked(sender: AnyObject) {
        votingView.hidden = true
        resultsView.hidden = false
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let params = ["user_forum_name":userDefaults.objectForKey("forumName") as! String,"research_topic_id":researchTopicId.description, "endorse":"0"]
        let urlString = "https://staging.partners.org/myapnea.org/api/research-topics/vote.json"
        voteFromView(params, urlString: urlString)
        updateEndorsementValue(researchTopicRating)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsView.hidden = true
        titleLabel.text = researchTopicTitle
        descriptionLabel.text = researchTopicDescription
        println(userHasVoted)
    }
    
    func updateEndorsementValue(value: Float) -> Void {
        let percentValue = value * 100.0
        endorsementValueLabel.text = "\(percentValue.description)%"
        endorsementProgressView.progress = value
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func voteFromView(params: NSDictionary, urlString: String) {
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
                    // Ensure success
                } else {
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("ERROR could not parse JSON: \(jsonStr)")
                }
            }
            
        })
        task.resume()
    }
    
}
