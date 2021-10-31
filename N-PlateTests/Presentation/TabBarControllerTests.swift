//
//  TabBarControllerTests.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import XCTest
import UIKit
@testable import N_Plate

// MARK: - Instantiation
extension TabBarControllerTests {
  func test_Store_CreatesWithSelectedTab() {
    let sutCore = TabBarCoreSpy()
    makeSUT(core: sutCore, startTab: .firstTab).viewWillAppear(false)
    XCTAssertTrue(sutCore.setupCalled)
  }
}

class TabBarControllerTests: XCTestCase {
  func makeSUT(core: TabBarCoreType, startTab: ApplicationTab) -> TabBarController {
    TabBarController(core: core, startTab: startTab)
  }
}

final class TabBarCoreSpy: TabBarCoreType {
  var setupCalled = false

  func setup() {
    setupCalled = true
  }
}
