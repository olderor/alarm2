//
//  AlarmCell.swift
//  alarm2
//
//  Created by olderor on 16.10.16.
//  Copyright © 2016 olderor. All rights reserved.
//

import Foundation
import UIKit

class AlarmCell : UITableViewCell {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var alarmEnableSwitch: UISwitch!
    
    var alarm: Alarm! = nil {
        didSet {
            timeLabel.text = alarm.time.toString()
            alarmEnableSwitch.isOn = alarm.enabled
            if !alarm.enabled {
                self.alpha = 0.5
            }
        }
    }
    
    
    @IBAction func onAlarmEnableSwitchValueChanged(_ sender: AnyObject) {
        alarm.enabled = !alarm.enabled
        if !alarm.enabled {
            self.alpha = 0.5
        } else {
            self.alpha = 1
        }
        AlarmCollection.saveAlarms()
    }
    
    
}
