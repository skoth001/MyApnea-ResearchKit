//
//  TopicViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/14/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController {
    
    var topicId = Int()
    var posts = NSArray()
    
    @IBOutlet var createdByLabel: UILabel!
    @IBOutlet var numberPostsLabel: UILabel!
    @IBOutlet var firstPostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get topic from API
        println(topicId)
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
                self.createdByLabel.text = self.posts[0].valueForKey("user") as? String
                self.numberPostsLabel.text = self.posts.count.description
                self.firstPostLabel.text = self.posts[0].valueForKey("description") as? String
            }
            
        })
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
