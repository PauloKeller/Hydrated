//
//  WaterModelTests.swift
//  HydratedTests
//
//  Created by Paulo Keller on 27/12/23.
//

import XCTest
@testable import Hydrated

final class WaterModelTests: XCTestCase {
  
  func testGetWaterInterval() {
    let sut = WaterModel()
    
    XCTAssertEqual(sut.getWaterInterval(totalWater: 2, waterFraction: 300), 3)
    XCTAssertEqual(sut.getWaterInterval(totalWater: 4, waterFraction: 300), 1)
  }
}
