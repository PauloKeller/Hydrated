//
//  LocalNotificationModelTests.swift
//  HydratedTests
//
//  Created by Paulo Keller on 27/12/23.
//

import XCTest
@testable import Hydrated

final class LocalNotificationModelTests: XCTestCase {
  func testModelCreation() {
    let sut = LocalNotificationModel(title: "New notification", body: "A cool message")
    
    XCTAssertEqual(sut.hours, 3)
  }
  
  func testCheckNotificationPermission() {
    let expectation = XCTestExpectation(description: "Test permission request")
    
    LocalNotificationModel.checkNotificationPermission { isGranted, error in
      XCTAssertNil(error)
      
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 3.0)
  }
  
  func testCreateRequest() {
    let expectation = XCTestExpectation(description: "Test create request")
    
    let sut = LocalNotificationModel(title: "New notification", body: "A cool message")
    
    sut.createRequest { wasSuccess, error in
      XCTAssertTrue(wasSuccess)
      XCTAssertNil(error)
      
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 3.0)
  }
}
