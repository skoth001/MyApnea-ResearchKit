//
//  TopicShowTableViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/14/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class TopicShowTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var topicId = Int()
    var posts = NSArray()
    
    // Ability to refresh on pull
    var refresher = UIRefreshControl()
    func refresh() {
        println("refreshing topic show table")
        let url = NSURL(string: "https://staging.partners.org/myapnea.org/api/forums/topics/\(topicId).json")
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: url!)
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            
            if (error != nil) {
                println(error)
            } else {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                self.posts = jsonResult.valueForKey("posts") as! NSArray
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
        
        // Initialize table
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // Get topic from API
        println(topicId)
        
        // Establish refresh gesture recognizer
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refresher)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Load data
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
        return posts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! TopicPostTableViewCell
        
        
        // Set clear background color
        cell.backgroundColor = UIColor.clearColor()
        
        // Set content
        cell.usernameLabel.text = posts[indexPath.row].valueForKey("user") as? String
        cell.postDescriptionLabel?.text = posts[indexPath.row].valueForKey("description") as? String
        cell.userImageView.layer.cornerRadius = CGFloat(20)
        cell.userImageView.clipsToBounds = true
        
        // Set text background
        cell.postTextView.layer.cornerRadius = 3
        
        return cell
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

    @IBAction func replyButtonTapped(sender: AnyObject) {
        
        self.performSegueWithIdentifier("replyButtonSegue", sender: nil)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "replyButtonSegue" {
            let destination = segue.destinationViewController as! PostNewViewController
            destination.topicId = self.topicId
            destination.topicName = self.title!
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
