//
//  corporal.swift
//  Corporal App
//
//  Created by John Swan on 15.08.2021.
//

import Foundation

struct TimeStamp {
    var hours: Int?
    var minutes: Int?
}

struct TimeTableItem {
    var beginTime: TimeStamp
    var endTime: TimeStamp?
    var title: String?
}

let defaultTimeTable: [TimeTableItem] = [
    TimeTableItem(beginTime: TimeStamp(hours: 6, minutes: 0), endTime: TimeStamp(hours: 6, minutes: 30), title: "Awaking from dead"),
    TimeTableItem(beginTime: TimeStamp(hours: 6, minutes: 30), endTime: TimeStamp(hours: 7, minutes: 0), title: "Taking a shit"),
    TimeTableItem(beginTime: TimeStamp(hours: 7, minutes: 0), endTime: TimeStamp(hours: 8, minutes: 0), title: "Loading biofuel"),
    TimeTableItem(beginTime: TimeStamp(hours: 8, minutes: 0), endTime: TimeStamp(hours: 11, minutes: 30), title: "Stagnation"),
]
