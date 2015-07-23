//
//  InitialViewController.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 7/23/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private var welcomePageViewController = WelcomePageViewController()
    private let pageTitles = ["Welcome",
        "About This Study",
        "How It Works",
        "Who Can Participate?"]
    private let pageSubtitles = ["A Sleep Apnea Research Study & Patient-Powered Community",
        "We are inviting thousands of people with sleep apnea and their caregivers to come together at MyApnea to learn more about symptoms and treatment, to share their experiences with others within the community, and to become part of a national research network to improve lives. It’s a whole new way of finding help—for you and for millions of people with sleep apnea. \n\n MyApnea is what’s called patient-powered research. Together, members share health information, discuss experiences regarding treatment, and express views directly to researchers and sleep experts on future research projects that can make a difference. In return, you will get easy-to-use tools to track your health and will be able to learn from others about treatments, symptoms, and coping with sleep apnea to take control of your life. And we will report back on all interesting research findings, in language you don’t have to be a scientist to understand.",
        "Participants will go through the following steps: \n\n 1. Read and agree to consent \n 2. Register to create an account \n\n Once that’s complete, participants are then able to: \n 1. Complete surveys \n 2. Complete other activities \n 3. Share your story in the community discussions \n 4. Share sensor data and link it with your reported data",
        "The study of this app is primarily open to adults ages 18 and over who have either been diagnosed with sleep apnea or are at-risk of sleep apnea."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if pageTitles.count > 0 {
            createWelcomePageViewController()
            setupPageControl()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let forumName = userDefaults.objectForKey("forumName") as? String {
            if !forumName.isEmpty {
                segueToTabbedController()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - WelcomePageViewController
    
    private func createWelcomePageViewController() {
        // Establish view controller array
        let firstController = getItemController(0)
        if firstController != nil {
            let startingViewControllers: NSArray = [firstController!]
            
            // Set Page View Controller
            self.welcomePageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("WelcomeController") as! WelcomePageViewController
            self.welcomePageViewController.dataSource = self
            self.welcomePageViewController.setViewControllers(startingViewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
            self.welcomePageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height-100)
            self.addChildViewController(welcomePageViewController)
            self.view.addSubview(welcomePageViewController.view)
            welcomePageViewController.didMoveToParentViewController(self)
            
            // Create footer
            let footerView = UIView(frame: CGRectMake(0, self.view.frame.height-100, self.view.frame.width, self.view.frame.height))
            footerView.backgroundColor = UIColor(red: 89.0/255.0, green: 153.0/255.0, blue: 222.0/255.0, alpha: 1.0)
            
            // Add CTA to footer
            let joinButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            joinButton.frame = CGRectMake(50, footerView.frame.origin.y + 20, self.view.frame.width-100, 40)
            joinButton.backgroundColor = UIColor(red: 255.0/255.0, green: 164.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            joinButton.setTitle("Join Now", forState: UIControlState.Normal)
            joinButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            joinButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
            joinButton.layer.cornerRadius = 7
            joinButton.layer.borderWidth = 1
            joinButton.layer.borderColor = UIColor.clearColor().CGColor
            joinButton.addTarget(self, action: "segueToSignUp", forControlEvents: UIControlEvents.TouchUpInside)
            
            // Add Login to footer
            let loginButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            loginButton.frame = CGRectMake(50, footerView.frame.origin.y + 70, self.view.frame.width-100, 20)
            loginButton.backgroundColor = UIColor.clearColor()
            loginButton.setTitle("Already a member? Login", forState: UIControlState.Normal)
            loginButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            loginButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
            loginButton.titleLabel?.textAlignment = NSTextAlignment.Center
            loginButton.titleLabel?.font = loginButton.titleLabel?.font.fontWithSize(12.0)
            loginButton.addTarget(self, action: "segueToLogin", forControlEvents: UIControlEvents.TouchUpInside)
            
            // Add footer to view
            self.view.addSubview(footerView)
            self.view.addSubview(joinButton)
            self.view.addSubview(loginButton)
        }
    }
    
    private func setupPageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.grayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        pageControl.backgroundColor = UIColor.clearColor()
    }
    
    
    // MARK - UIPageViewControllerDelegate
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! WelcomeItemViewController
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! WelcomeItemViewController
        if itemController.itemIndex+1 < pageTitles.count {
            return getItemController(itemController.itemIndex+1)
        }
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> WelcomeItemViewController? {
        if itemIndex < pageTitles.count {
            let welcomeItemViewController = self.storyboard!.instantiateViewControllerWithIdentifier("WelcomeItem") as! WelcomeItemViewController
            welcomeItemViewController.itemIndex = itemIndex
            welcomeItemViewController.pageTitle = pageTitles[itemIndex]
            welcomeItemViewController.pageSubtitle = pageSubtitles[itemIndex]
            return welcomeItemViewController
        } else {
            return nil
        }
    }
    
    // MARK - PageController
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    // MARK - Navigation
    func segueToSignUp() {
        self.performSegueWithIdentifier("segueToSignup", sender: self)
    }
    func segueToLogin() {
        self.performSegueWithIdentifier("segueToLogin", sender: self)
    }
    
    func segueToTabbedController() {
        self.performSegueWithIdentifier("segueToTabbedAppFromInit", sender: nil)
    }
}
