//
//  lessonViewController.swift
//  Eikaiwa-22
//
//  Created by Steven Chuob on 3/8/15.
//  Copyright (c) 2015 infinitejester. All rights reserved.
//

import UIKit
import CoreData

class LessonViewController: UIViewController {
    @IBOutlet var lessonNameLabel: UILabel!
    var managedObjectContext: NSManagedObjectContext!
    var lessonName = String()
    
    override func viewWillAppear(animated: Bool) {
        lessonNameLabel.text = lessonName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
