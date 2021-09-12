//
//  TimeTableEntity+CoreDataProperties.swift
//  Corporal App
//
//  Created by John Swan on 13.09.2021.
//
//

import Foundation
import CoreData


extension TimeTableEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeTableEntity> {
        return NSFetchRequest<TimeTableEntity>(entityName: "TimeTableEntity")
    }

    @NSManaged public var caption: String?
    @NSManaged public var attribute: NSObject?

}

extension TimeTableEntity : Identifiable {

}
