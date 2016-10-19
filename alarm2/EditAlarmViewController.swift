//
//  EditAlarmViewController.swift
//  alarm2
//
//  Created by olderor on 17.10.16.
//  Copyright © 2016 olderor. All rights reserved.
//

import Foundation
import UIKit

class EditAlarmViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var alarm: Alarm! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if alarm == nil {
            return
        }
        var components = DateComponents()
        components.hour = alarm.time.hour
        components.minute = alarm.time.minute
        
        datePicker.setDate(Calendar.current.date(from: components)!, animated: false)
    }
    
    @IBAction func onDoneTouchUpInside(_ sender: AnyObject) {
        
        let time = Time(date: datePicker.date)
        if AlarmCollection.contains(time: time) {
            let alert = UIAlertController(title: "Warning", message: "You already have alarm with time \(time.toString())", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if alarm == nil {
            alarm = Alarm(time: time, enabled: true)
            AlarmCollection.addAlarm(alarm: alarm)
        }
        alarm.time = time
        AlarmCollection.sort()
        AlarmCollection.saveAlarms()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backBarButtonItemTouchUpInside(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
