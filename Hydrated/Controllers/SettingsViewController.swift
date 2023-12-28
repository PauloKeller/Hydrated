//
//  SettingsViewController.swift
//  Hydrated
//
//  Created by Paulo Keller on 23/12/23.
//

import UIKit

class SettingsViewController: UIViewController {
  @IBOutlet weak var waterPerDayLabel: UILabel!
  @IBOutlet weak var waterPerIntervalLabel: UILabel!
  
  var waterInLiters: Float = 2
  var waterFraction: Float = 250
  
  let localNotificationManager = LocalNotificationManager.shared
  
  let waterModel = WaterModel()
  
  @IBAction func waterSliderValueChanged(_ sender: UISlider) {
    let roundedValue = round(sender.value)
    sender.value = roundedValue
    waterInLiters = roundedValue
    
    waterPerDayLabel.text = "\(waterInLiters)"
  }
  
  @IBAction func waterPerIntervalSliderValueChanged(_ sender: UISlider) {
    let roundedValue = round(sender.value)
    sender.value = roundedValue
    waterFraction = roundedValue
    
    waterPerIntervalLabel.text = "\(waterFraction)"
  }
  
  @IBAction func saveButtonTapped(_ sender: Any) {
    let interval = waterModel.getWaterInterval(totalWater: Double(waterInLiters), waterFraction: Double(waterFraction))
    localNotificationManager.setInterval(hours: interval)
    localNotificationManager.model.createRequest()
    
    navigationController?.popViewController(animated: true)
  }
}
