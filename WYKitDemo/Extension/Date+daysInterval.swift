//
//  Date+daysInterval.swift
//
//  Created by Will on 2021/2/2.
//

import UIKit

enum DateFormat: String {
    case full = "yyyy/MM/dd HH:mm:ss"
    case fullToMinute = "yyyy/MM/dd HH:mm"
    case date = "yyyy/MM/dd"
    case time = "HH:mm:ss"
    case timeToMinute = "HH:mm"
}

extension Date {
    
    func convertToString(dateFormat:DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: self)
    }
    
    func getDaysIntervalFromNow() -> Int? {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: self)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day
    }
    
    /*
    func saleTimeWeekday(next: Int = 0) -> String {
        var weekday = Calendar.current.component(.weekday, from: self)
        weekday += next
        weekday = weekday % 7
        weekday = weekday == 0 ? 7 : weekday
        
        switch weekday {
        case 1:
            return "sun"
        case 2:
            return "mon"
        case 3:
            return "tue"
        case 4:
            return "wed"
        case 5:
            return "thu"
        case 6:
            return "fri"
        case 7:
            return "sat"
        default:
            return ""
        }
    }
    */
}
