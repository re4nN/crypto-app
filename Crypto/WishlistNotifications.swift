//
//  WishlistNotifications.swift
//  Crypto
//
//  Created by Ryan Rouxinol on 22/09/24.
//

import UIKit
import UserNotifications

class WishlistNotifications {
    
    func checkForPermission(){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            case.denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow{
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
        
    }
    func dispatchNotification() {
        let identifier = "wishlistUpdate-notification"
        let title = "Watchlist Updated!"
        let body = "BTC price is now $62,622.90"
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        if let imageURL = Bundle.main.url(forResource: "AppIcon", withExtension: "png") {
            do {
                let attachment = try UNNotificationAttachment(identifier: "appIcon", url: imageURL, options: nil)
                content.attachments = [attachment]
            } catch {
                print("Error adding icon: \(error)")
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 120, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // Adiciona a nova notificação
        notificationCenter.add(request) { error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("Notification scheduled successfully with identifier: \(identifier).")
            }
        }
    }
}
 
