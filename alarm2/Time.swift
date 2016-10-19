//
//  Time.swift
//  alarm2
//
//  Created by olderor on 16.10.16.
//  Copyright © 2016 olderor. All rights reserved.
//

import Foundation

extension Int {
    func toTimeString() -> String {
        if (self < 10) {
            return "0\(self)"
        }
        return "\(self)"
    }
}

class Time {
    
    var hour: Int
    var minute: Int
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
    
    init(date: Date) {
        let calendar = NSCalendar.current
        self.hour = calendar.component(.hour, from: date)
        self.minute = calendar.component(.minute, from: date)
        
    }
    
    func toString() -> String {
        return hour.toTimeString() + ":" + minute.toTimeString()
    }
    
}
