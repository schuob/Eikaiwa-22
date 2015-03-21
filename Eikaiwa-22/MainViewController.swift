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
        title = "Eikaiwa 22"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "lessonCell")
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lessonCell") as UITableViewCell
        let lessonObj = lessonsNSMObj[indexPath.row]
        println(lessonObj.valueForKey("phrase") as String!)
        cell.textLabel!.text = lessonObj.valueForKey("phrase") as String?
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLesson" {
            var tabBarVC: UITabBarController = segue.destinationViewController as UITabBarController
            //var descVC: LessonsDetailsViewController = segue.destinationViewController as LessonsDetailsViewController
            var descVC: LessonsDetailsViewController = tabBarVC.viewControllers?.first as LessonsDetailsViewController
            var row = sender as Int
            //var row = tableView!.indexPathForSelectedRow()!.row
            var dataObj = lessonsNSMObj[row]
            descVC.managedObject = dataObj
        }
    }

    // this is require to make prepareForSegue to work for some reason
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        performSegueWithIdentifier("showLesson", sender: row)
    }
}