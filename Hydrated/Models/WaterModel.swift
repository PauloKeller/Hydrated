//
//  WaterModel.swift
//  Hydrated
//
//  Created by Paulo Keller on 23/12/23.
//

import Foundation

struct WaterModel {
  private let dayHours = 24.0
  
  func getWaterInterval(totalWater: Double, waterFraction: Double) -> Int {
    let totalWaterInLiters = totalWater * 1000
    let neededIntervals = totalWaterInLiters / waterFraction
    let dailyIntervals = dayHours / neededIntervals

    return Int(dailyIntervals)
  }
}
