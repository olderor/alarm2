//
//  AlarmCollection.swift
//  alarm2
//
//  Created by olderor on 16.10.16.
//  Copyright © 2016 olderor. All rights reserved.
//

import Foundation

class AlarmCollection {
    
    
    static var alarms: [Alarm]! = nil
    
    static func getAlarms() -> [Alarm] {
        if alarms == nil {
            alarms = []
        }
        return alarms
    }
    
    static func setAlarms(alarms: [Alarm]) {
        AlarmCollection.alarms = alarms
        AlarmCollection.alarms.sort() { $0.time.hour < $1.time.hour || $0.time.hour == $1.time.hour && $0.time.minute < $1.time.minute }
    }
    
    static func saveAlarms() {
        /*
        let ud = UserDefaults.standard
        ud.set(NSKeyedArchiver.archivedData(withRootObject: alarms), forKey: "alarms")
        ud.synchronize()
        loadAlarms()*/
    }
    
    static func loadAlarms() {
        /*
        let ud = UserDefaults.standard
        let data = ud.object(forKey: "alarms") as? Data
        if data == nil {
            alarms = []
            print("Failed to get data from UserDefaults")
            return
        }
        let nsarray = (NSKeyedUnarchiver.unarchiveObject(with: data!) as? NSArray)
        let value = nsarray as? [Alarm]
        if (value != nil) {
            alarms = value!
        } else {
            alarms = []
            print("Failed to unarchive alarms from UserDefaults")
        }*/
    }
    
    static func removeAlarm(index: Int) {
        getAlarms()
        alarms.remove(at: index)
    }
    
    static func addAlarm(alarm: Alarm) {
        if contains(time: alarm.time) {
            return
        }
        var index = 0
        for i in 0 ..< alarms.count {
            if alarm.time.hour < alarms[i].time.hour {
                break
            }
            if alarm.time.hour == alarms[i].time.hour && alarm.time.minute < alarms[i].time.minute {
                break
            }
            index += 1
        }
        
        alarms.insert(alarm, at: index)
        saveAlarms()
    }
    
    static func sort() {
        
        func compare(a: Alarm, b: Alarm) -> Bool {
            if a.time.hour < b.time.hour {
                return true
            }
            if a.time.hour == b.time.hour && a.time.minute < b.time.minute {
                return true
            }
            return false
        }
        
        alarms.sort(by: compare)
    }
    
    static func contains(time: Time) -> Bool {
        for alarm in getAlarms() {
            if alarm.time.hour == time.hour && alarm.time.minute == time.minute {
                return true
            }
        }
        return false
    }
    
}
