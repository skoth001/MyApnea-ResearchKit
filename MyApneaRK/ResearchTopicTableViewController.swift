//
//  ResearchTopicTableViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/30/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class ResearchTopicTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var researchTopics:NSArray = [NSDictionary]()
    let researchTopicSegueIdentifier = "ShowResearchTopicSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = NSURL(string: "http://localhost/edge/www.myapnea.org/research-topics.json")
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url!)
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            
            if (error != nil) {
                println(error)
            } else {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                self.researchTopics = jsonResult.valueForKey("research_topics") as! NSArray
                self.tableView.reloadData()
            }
            
        })
        
        task.resume()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return researchTopics.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ResearchTopicCell")
        let researchTopic = researchTopics[indexPath.row] as! NSDictionary
        let title = researchTopic.valueForKey("title") as! NSString
        cell.textLabel?.text = title as String
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == researchTopicSegueIdentifier {
            if let destination = segue.destinationViewController as? ResearchTopicViewController {
                if let researchTopicIndex = tableView.indexPathForSelectedRow()?.row {
                    println(researchTopicIndex)
                    destination.researchTopicTitle = researchTopics[researchTopicIndex].valueForKey("title") as! String
                    destination.researchTopicDescription = researchTopics[researchTopicIndex].valueForKey("description") as! String
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(researchTopicSegueIdentifier, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
