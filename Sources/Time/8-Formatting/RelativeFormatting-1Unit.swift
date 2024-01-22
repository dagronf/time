//
//  RelativeFormatting-1Unit.swift
//  Time
//
//  Created by Dave DeLong on 5/18/18.
//

import Foundation

extension Absolute {
    
    public func format(timeZone: Template<TimeZone>) -> String {
        return format([timeZone])
    }
    
}

extension Absolute where Smallest: LTOEYear {
    
    public func format(year: Template<Year>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([year, timeZone])
    }
    
}

extension Absolute where Smallest: LTOEMonth {
    
    public func format(month: Template<Standalone<Month>>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([month, timeZone])
    }
    
}

extension Absolute where Smallest: LTOEDay {
    
    public func format(day: Template<Day>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([day, timeZone])
    }
    
    public func format(weekday: Template<Standalone<Weekday>>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([weekday, timeZone])
    }
    
}

extension Absolute where Smallest: LTOEHour {
    
    public func format(hour: Template<Hour>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([hour, timeZone])
    }
    
}

extension Absolute where Smallest: LTOEMinute {
    
    public func format(minute: Template<Minute>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([minute, timeZone])
    }
    
}

extension Absolute where Smallest: LTOESecond {
    
    public func format(second: Template<Second>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([second, timeZone])
    }
    
}

extension Absolute where Smallest: LTOENanosecond {
    
    public func format(nanosecond: Template<Nanosecond>,
                       timeZone: Template<TimeZone>? = nil) -> String {
        return format([nanosecond, timeZone])
    }
    
}