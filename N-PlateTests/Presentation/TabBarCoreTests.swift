//
//  TabBarCoreTests.swift
//  Created by Ilya Sakalou on 02/11/2021.
//

import XCTest
import UIKit
@testable import N_Plate

// MARK: - Instantiation
extension TabBarCoreTests {
  func test_instantiation() {
    let sut = makeSUT(initialTab: .firstTab)
    XCTAssertTrue(sut.needSetup)
    XCTAssertEqual(sut.currentTab, .firstTab)
  }

  func test_setup_called_once() {
    let sut = makeSUT(initialTab: .firstTab)
    XCTAssertTrue(sut.needSetup)
    XCTAssertEqual(sut.currentTab, .firstTab)
  }
}

class TabBarCoreTests: XCTestCase {
  func makeSUT(initialTab: ApplicationTab) -> TabBarCore {
    TabBarCore(initialTab: initialTab)
  }
}
