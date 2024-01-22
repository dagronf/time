//
//  File.swift
//  
//
//  Created by Dave DeLong on 1/20/24.
//

import Foundation

public struct AbsoluteFormatStyle<Smallest: Unit & LTOEEra> {
    
    internal let configuration: FormatConfiguration
    
    internal init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        self.configuration = .styles(dateStyle, timeStyle)
    }
    
    internal init(raw: String) {
        self.configuration = .raw(raw)
    }
    
    internal init(templates: Array<Format?>) {
        self.configuration = .template(templates.compactMap { $0?.template }.joined())
    }
    
    init(naturalFormats calendar: Calendar) {
        let formats = Absolute<Smallest>.naturalFormats(in: calendar)
        self.init(templates: formats)
    }
    
}

extension Absolute {
    
    private func format<S>(_ style: AbsoluteFormatStyle<S>) -> String {
        let key = DateFormatter.Key(configuration: style.configuration,
                                    region: self.region)
        
        let formatter = DateFormatter.formatter(for: key)
        
        return formatter.string(from: self.dateForFormatting())
    }
    
    internal func format(_ templates: Array<Format?>) -> String {
        let style = AbsoluteFormatStyle<Smallest>(templates: templates)
        return format(style)
    }
    
    public func format(using style: AbsoluteFormatStyle<Smallest>) -> String {
        return format(style)
    }
    
    public func format<U>(using style: AbsoluteFormatStyle<U>) -> String where Smallest: LTOEYear, U: LTOEEra {
        return format(style)
    }
    
    public func format<U>(using style: AbsoluteFormatStyle<U>) -> String where Smallest: LTOEMonth, U: LTOEYear {
        return format(style)
    }
    
    public func format<U>(using style: AbsoluteFormatStyle<U>) -> String where Smallest: LTOEDay, U: LTOEMonth {
        return format(style)
    }
    
    public func format<U>(using style: AbsoluteFormatStyle<U>) -> String where Smallest: LTOEHour, U: LTOEDay {
        return format(style)
    }
    
    public func format<U>(using style: AbsoluteFormatStyle<U>) -> String where Smallest: LTOEMinute, U: LTOEHour {
        return format(style)
    }
    
    public func format<U>(using style: AbsoluteFormatStyle<U>) -> String where Smallest: LTOESecond, U: LTOEMinute {
        return format(style)
    }
    
    public func format<U>(using style: AbsoluteFormatStyle<U>) -> String where Smallest: LTOENanosecond, U: LTOESecond {
        return format(style)
    }
    
}