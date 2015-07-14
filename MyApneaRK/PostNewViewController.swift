//
//  PostNewViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/14/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class PostNewViewController: UIViewController {

    var activityIndicator = UIActivityIndicatorView()
    var topicId = Int()
    var topicName = String()
    
    @IBOutlet var postTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        // Initialize activity indicator
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        activityIndicator.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        // Setup request
        let urlString = "https://staging.partners.org/myapnea.org/api/forums/posts/create"
        var request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        // Set params based on input
        let params = ["user_forum_name":NSUserDefaults.standardUserDefaults().objectForKey("forumName") as! String,"topic_id":self.topicId.description, "post":["description":postTextField.text]]
        
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
                    println("Successfully created post)")
                    // Ensure success
                } else {
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("ERROR could not parse JSON: \(jsonStr)")
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            
        })
        task.resume()
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
