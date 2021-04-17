//
//  FormatDeduction.swift
//  
//
//  Created by Dave DeLong on 2/4/20.
//

import Foundation

fileprivate let likelyFormats: Dictionary<Calendar.Component, Array<Format>> = [
    .era: [
        Template<Era>.abbreviated
    ],
    .year: [
        Template<Year>.naturalDigits,
        Template<Year>.twoDigits
    ],
    .month: [
        Template<Month>.naturalDigits,
        Template<Month>.twoDigits,
        Template<Month>.abbreviatedName,
        Template<Month>.naturalName
    ],
    .day: [
        Template<Day>.naturalDigits,
        Template<Day>.twoDigits
    ],
    .hour: [
        Template<Hour>.naturalDigits,
        Template<Hour>.naturalDigits(with: .natural),
        Template<Hour>.twoDigits,
        Template<Hour>.twoDigits(with: .natural)
    ],
    .minute: [
        Template<Minute>.twoDigits
    ],
    .second: [
        Template<Second>.twoDigits
    ],
    .weekday: [
        Template<Weekday>.abbreviatedName,
        Template<Weekday>.naturalName
    ],
    .nanosecond: [
        Template<Nanosecond>.digits(4)
    ],
    .timeZone: [
        Template<TimeZone>.shortSpecific,
        Template<TimeZone>.ISO8601WithHoursAndMinutes(extended: false, includingZ: false),
        Template<TimeZone>.ISO8601WithHoursAndMinutes(extended: true, includingZ: false),
        Template<TimeZone>.ISO8601WithHoursAndMinutes(extended: false, includingZ: true),
        Template<TimeZone>.ISO8601WithHoursAndMinutes(extended: true, includingZ: true),
        Template<TimeZone>.longID
    ],
]

internal func deduceAbsoluteFormat(string: String, region: Region, units: Set<Calendar.Component>) throws -> String {
    var allPossibleUnitSets = [
        units
    ]
    
    if units.contains(.year) && !units.contains(.era) {
        // if we're looking for years, we might have to look for eras too
        allPossibleUnitSets.append(units.union([.era]))
    }
    
    if units.contains(.day) && !units.contains(.weekday) {
        let bases = allPossibleUnitSets
        for base in bases {
            allPossibleUnitSets.append(base.union([.weekday]))
        }
    }
    
    if units.contains(.minute) && !units.contains(.timeZone) {
        let bases = allPossibleUnitSets
        for base in bases {
            allPossibleUnitSets.append(base.union([.timeZone]))
        }
    }
    
    throw TimeError.cannotParseString(string, in: region)
    
}
