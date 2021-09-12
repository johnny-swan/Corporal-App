//
//  TimeTableEvent+CoreDataProperties.swift
//  Corporal App
//
//  Created by John Swan on 13.09.2021.
//
//

import Foundation
import CoreData


extension TimeTableEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeTableEvent> {
        return NSFetchRequest<TimeTableEvent>(entityName: "TimeTableEvent")
    }

    @NSManaged public var startHour: Int16
    @NSManaged public var startMinute: Int16
    @NSManaged public var caption: String?

}

extension TimeTableEvent : Identifiable {

}
