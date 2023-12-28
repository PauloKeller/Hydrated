//
//  LocalNotificationManager.swift
//  Hydrated
//
//  Created by Paulo Keller on 27/12/23.
//

import Foundation

class LocalNotificationManager {
  static let shared = LocalNotificationManager()
  
  private(set) var model: LocalNotificationModel
  
  public func setInterval(hours: Int) {
    model.hours = TimeInterval(hours)
  }
  
  private init() {
    model = LocalNotificationModel(title: "Water reminder", body: "Time to drink more water, refresh your body buddy!")
  }
}
