//
//  LessonET.swift
//  Eikaiwa-22
//
//  Created by Steven Chuob on 3/11/15.
//  Copyright (c) 2015 infinitejester. All rights reserved.
//

import Foundation
import CoreData

class LessonET: NSManagedObject {
    @NSManaged var lesson_key: String
    @NSManaged var meaning: String
    @NSManaged var origin: String
    @NSManaged var phrase: String
}
