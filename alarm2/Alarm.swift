//
//  Alarm.swift
//  alarm2
//
//  Created by olderor on 16.10.16.
//  Copyright © 2016 olderor. All rights reserved.
//

import Foundation

class Alarm {
    
    var time: Time
    var enabled: Bool
    
    init(time: Time, enabled: Bool) {
        self.time = time
        self.enabled = enabled
    }
    
}
