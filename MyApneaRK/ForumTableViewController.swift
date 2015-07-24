//
//  ForumTableViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/14/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class ForumTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var forumTopics:NSArray = [NSDictionary]()
    var topicSelectedId = Int()
    var topicSelectedName = String()
    
    // Refresh data
    var refresher = UIRefreshControl()
    func refresh() {
        println("refreshing topic index")
        let url = NSURL(string: "https://staging.partners.org/myapnea.org/api/forums/topics.json")
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url!)
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            
            if (error != nil) {
                println(error)
            } else {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                self.forumTopics = jsonResult.valueForKey("topics") as! NSArray
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.tableView.setNeedsLayout()
                    self.tableView.layoutIfNeeded()
                    self.tableView.reloadData()
                    self.refresher.endRefreshing()
                })
            }
            
        })
        
        task.resume()
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize table view
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Discussions"

        // Establish refresh gesture recognizer
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refresher)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Retrieve forum data
        refresh()
        configureTableView()
        refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return forumTopics.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell", forIndexPath: indexPath) as! TopicTableViewCell
        let topic = forumTopics[indexPath.row] as! NSDictionary
        
        // Set clear background color
        cell.backgroundColor = UIColor.clearColor()
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        cell.selectedBackgroundView = selectedView
        
        // Set content
        cell.titleLabel.text = topic.valueForKey("name") as? String
        cell.titleLabel.textColor = UIColor(red: 89.0/255.0, green: 153.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        cell.subtitlelabel.text = "Yesterday"
        cell.userImageView.layer.cornerRadius = CGFloat(20)
        cell.userImageView.clipsToBounds = true
        
        // Set text background
        cell.topicTextView.layer.cornerRadius = 3
        return cell
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let topic = forumTopics[indexPath.row] as! NSDictionary
        self.topicSelectedId = topic.valueForKey("id") as! Int
        self.topicSelectedName = topic.valueForKey("name") as! String
        self.performSegueWithIdentifier("showTopicSegue", sender: nil)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showTopicSegue" {
            let destination = segue.destinationViewController as! TopicShowTableViewController
            destination.topicId = self.topicSelectedId as Int
            destination.title = self.topicSelectedName
            
        }
    }
    
    // MARK: - TableViewCell
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 84.0
    }
    
    func refreshData() {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
            self.tableView.scrollRectToVisible(CGRectMake(0, 0, 1, 1), animated: false)
        })
    }
    

}
