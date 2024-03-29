//
//  TopicNewViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/14/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class TopicNewViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    
    var activityIndicator = UIActivityIndicatorView()
    var topicId = Int()
    var topicCreatedName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        // Set background
        let colorTop = UIColor(red: 255.0/255.0, green: 164.0/255.0, blue: 0.0/255.0, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 247.0/255.0, green: 107.0/255.0, blue: 28.0/255.0, alpha: 1.0).CGColor
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorTop, colorBottom]
        gradient.locations = [0.0, 1.0]
        let frameMax = max(self.view.frame.width, self.view.frame.height)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: frameMax, height: frameMax)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createButtonTapped(sender: AnyObject) {
        
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
        let urlString = "https://staging.partners.org/myapnea.org/api/forums/topics/create"
        var request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        // Set params based on input
        let params = ["user_forum_name":NSUserDefaults.standardUserDefaults().objectForKey("forumName") as! String,"forum_id":"1", "topic":["name":nameTextField.text, "description":descriptionTextField.text]]
        
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
                    self.topicId = parseJSON["id"] as! Int
                    self.topicCreatedName = parseJSON["name"] as! String
                    println("Successfully created: \(self.topicId)")
                    // Ensure success
                } else {
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("ERROR could not parse JSON: \(jsonStr)")
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                self.performSegueWithIdentifier("showTopicAfterCreateSegue", sender: nil)
            })
            
        })
        task.resume()

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showTopicAfterCreateSegue" {
            let destination = segue.destinationViewController as! TopicShowTableViewController
            destination.topicId = self.topicId
            destination.title = self.topicCreatedName
        }
    }


}
