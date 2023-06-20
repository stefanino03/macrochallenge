//
//  notificationFunc.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 09/06/23.
//

import Foundation
import UserNotifications

func scheduleNotifications()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
            {
                success, error in if success
                    {
                        print("Success")
                    }
                else if let error = error
                    {
                        print(error.localizedDescription)
                    }
            }
        let content = UNMutableNotificationContent()
        content.title = "Heartalk"
        content.body = "Check out the quote of the day!"
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.hour = 16
        dateComponents.minute = 25
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

