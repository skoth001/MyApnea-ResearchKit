//
//  ResearchTopicTableViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/30/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class ResearchTopicTableViewController: UITableViewController, UITableViewDelegate {
    
    var researchTopics:NSArray = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("research topic table appeared")
        
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
            }
            
        })
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
