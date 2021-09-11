//
//  corporal.swift
//  Corporal App
//
//  Created by John Swan on 15.08.2021.
//

import Foundation

struct TimeStamp: CustomStringConvertible {
    var hours: Int
    var minutes: Int
    
    // this line give object abitity to be "Stringed" from anywhere in code
    var description: String {
        // create hours label
        var stringHours = String(self.hours)
        if self.hours < 10 {
            stringHours.insert("0", at: stringHours.startIndex)
        }
        // create minutes label
        var stringMinutes = String(self.minutes)
        if self.minutes < 10 {
            stringMinutes.insert("0", at: stringMinutes.startIndex)
        }
            
        return stringHours + ":" + stringMinutes
    }
    
}

struct TimeTableItem {
    var beginTime: TimeStamp
    var endTime: TimeStamp?
    var title: String?
    
    var description: String {
        var descString = ""
        descString += String(describing: beginTime)
        descString.append(", ")
        descString += String(describing: endTime)
        descString.append(": ")
        descString.append(title!)
        return descString
    }
}

struct TimeTable {
    var TTItems: [TimeTableItem]
    var Caption: String
}



let defaultTimeTableItems: [TimeTableItem] = [
    TimeTableItem(beginTime: TimeStamp(hours: 6, minutes: 0), endTime: TimeStamp(hours: 6, minutes: 30), title: "Awaking from dead"),
    TimeTableItem(beginTime: TimeStamp(hours: 6, minutes: 05), endTime: nil, title: "Cry for help"),
    TimeTableItem(beginTime: TimeStamp(hours: 6, minutes: 30), endTime: TimeStamp(hours: 7, minutes: 0), title: "Taking a shit"),
    TimeTableItem(beginTime: TimeStamp(hours: 7, minutes: 0), endTime: TimeStamp(hours: 8, minutes: 0), title: "Loading biofuel"),
    TimeTableItem(beginTime: TimeStamp(hours: 8, minutes: 0), endTime: TimeStamp(hours: 11, minutes: 30), title: "Stagnation"),
]
let defaultTimeTable = TimeTable(TTItems: defaultTimeTableItems, Caption: "Working TimeTable")

let weekendTimeTableItems: [TimeTableItem] = [
    TimeTableItem(beginTime: TimeStamp(hours: 6, minutes: 0), endTime: TimeStamp(hours: 6, minutes: 30), title: "Awaking from dead"),
    TimeTableItem(beginTime: TimeStamp(hours: 6, minutes: 30), endTime: TimeStamp(hours: 7, minutes: 0), title: "Taking a shit"),
    TimeTableItem(beginTime: TimeStamp(hours: 7, minutes: 0), endTime: TimeStamp(hours: 8, minutes: 0), title: "Loading biofuel"),
    TimeTableItem(beginTime: TimeStamp(hours: 8, minutes: 0), endTime: TimeStamp(hours: 11, minutes: 30), title: "Stagnation"),
]

let weekendTimeTable = TimeTable(TTItems: weekendTimeTableItems, Caption: "Weekend")

var timeTables: [TimeTable] = [defaultTimeTable, weekendTimeTable]

