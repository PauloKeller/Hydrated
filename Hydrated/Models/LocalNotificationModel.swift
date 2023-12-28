//
//  LocalNotificationModel.swift
//  Hydrated
//
//  Created by Paulo Keller on 23/12/23.
//

import UserNotifications

struct LocalNotificationModel {
  private let content = UNMutableNotificationContent()
  var hours: TimeInterval = 3
  
  init (title: String, body: String) {
    content.title = title
    content.body = body
  }
  
  private func createNotificationTrigger() -> UNTimeIntervalNotificationTrigger {
    let minutesInSeconds: TimeInterval = 60
    let seconds: TimeInterval = 60
    let totalSeconds = self.hours * minutesInSeconds * seconds
    
    return UNTimeIntervalNotificationTrigger(timeInterval: totalSeconds, repeats: true)
  }
  
  static func checkNotificationPermission(completion: @escaping (Bool, Error?) -> ()) {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
      completion(granted, error)
    }
  }
  
  func createRequest() {
    let center = UNUserNotificationCenter.current()
    let trigger = createNotificationTrigger()
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    center.add(request) { error in
      if let error = error {
        print("Error scheduling notification: \(error.localizedDescription)")
      } else {
        print("Repeating notification scheduled successfully")
      }
    }
  }
}
