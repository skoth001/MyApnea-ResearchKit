//
//  ResearchTopicTableViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/30/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class ResearchTopicTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var researchTopics:NSArray = [NSDictionary]()
    let researchTopicSegueIdentifier = "ShowResearchTopicSegue"
    var votePresentForResearchTopic = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 86.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let url = NSURL(string: "https://staging.partners.org/myapnea.org/api/research-topics.json")
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url!)
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            
            if (error != nil) {
                println(error)
            } else {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                self.researchTopics = jsonResult.valueForKey("research_topics") as! NSArray
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.tableView.setNeedsLayout()
                    self.tableView.layoutIfNeeded()
                    self.tableView.reloadData()
                })
            }
            
        })
        
        task.resume()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return researchTopics.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ResearchTopicCell", forIndexPath: indexPath) as! ResearchTopicTableViewCell
        let researchTopic = researchTopics[indexPath.row] as! NSDictionary
        let title = researchTopic.valueForKey("title") as! NSString
        cell.ResearchTopicTextLabel?.text = title as String
        cell.ResearchTopicTextLabel.sizeToFit()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("preparing for segue to research topic")
        if segue.identifier == researchTopicSegueIdentifier {
            if let destination = segue.destinationViewController as? ResearchTopicViewController {
                if let researchTopicIndex = tableView.indexPathForSelectedRow()?.row {
                    destination.researchTopicTitle = researchTopics[researchTopicIndex].valueForKey("title") as! String
                    destination.researchTopicDescription = researchTopics[researchTopicIndex].valueForKey("description") as! String
                    destination.researchTopicRating = researchTopics[researchTopicIndex].valueForKey("endorsement") as! Float
                    destination.researchTopicVoteCount = researchTopics[researchTopicIndex].valueForKey("votes") as! Int
                    destination.researchTopicId = researchTopics[researchTopicIndex].valueForKey("id") as! Int
//                    destination.userHasVoted = self.votePresentForResearchTopic
                }
            }
        } else if segue.identifier == "dummySegue" {
            println("dummy segue")
        }
        println("preparation complete")
    }
    

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("segue to research topic")
            
        if let researchTopicIndex = tableView.indexPathForSelectedRow()?.row {
            
            // Prepare variables for data task
            let researchTopicId = self.researchTopics[researchTopicIndex].valueForKey("id") as! Int
            let user = NSUserDefaults.standardUserDefaults().objectForKey("forumName") as! String
            let url = NSURL(string: "https://staging.partners.org/myapnea.org/api/research-topics/votes.json?research_topic_id=\(researchTopicId)&user=\(user)")
            let session = NSURLSession.sharedSession()
            let request = NSURLRequest(URL: url!)
            
            // Retrieve votes for research topic and user with data task
            let task = session.dataTaskWithURL(url!, completionHandler: {
                (data, response, error) -> Void in
                if (error != nil) {
                    println(error)
                } else {
                    let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                    if let votes = jsonResult.valueForKey("votes") as? NSArray {
                        if votes.count == 1 {
                            println("vote found")
                            self.votePresentForResearchTopic = true
                        } else {
                            println("vote not found")
                            self.votePresentForResearchTopic = false
                        }
                    } else {
                        println("vote not found or votes not correctly set")
                        self.votePresentForResearchTopic = false
                    }
                }
                
                // Send signal for seguein main thread
                println("sending signal to perform segue")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    println("sending asynchronously")
                    self.performSegueWithIdentifier(self.researchTopicSegueIdentifier, sender: nil)
                })
                
            })
            task.resume()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
