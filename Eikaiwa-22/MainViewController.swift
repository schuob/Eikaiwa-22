//
//  MainViewController.swift
//  Eikaiwa-22
//
//  Created by Steven Chuob on 3/6/15.
//  Copyright (c) 2015 infinitejester. All rights reserved.
//
import UIKit
import CoreData

class MainViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var lessonsNSMObj = [NSManagedObject]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        // setting fetch request
        let fetchLessons = NSFetchRequest(entityName:"LessonET")
        
        //3
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchLessons, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            lessonsNSMObj = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        title = "Eikaiwa 22"
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LessonCell") as UITableViewCell
        let lessonObj = lessonsNSMObj[indexPath.row]
        println(lessonObj.valueForKey("phrase") as String!)
        cell.textLabel!.text = lessonObj.valueForKey("phrase") as String?
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as UITableViewCell
        if segue.identifier == "showLesson" {
            // setting up the navigation transition
            var navVC: UINavigationController = segue.destinationViewController as UINavigationController
            var tabBarVC: UITabBarController = navVC.viewControllers.first as UITabBarController
            var descVC: LessonsDetailsViewController = tabBarVC.viewControllers?.first as LessonsDetailsViewController
            
            var row = self.tableView.indexPathForCell(cell)?.row
            var dataObj = lessonsNSMObj[row!]
            descVC.managedObject = dataObj
        }
    }
}