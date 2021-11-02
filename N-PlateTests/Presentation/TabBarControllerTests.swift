//
//  TabBarControllerTests.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import XCTest
import UIKit
@testable import N_Plate

// MARK: - Instantiation
extension TabBarControllerTests {
  func test_controller_persists_core() {
    let sutCore = TabBarCoreSpy()
    makeSUT(core: sutCore, startTab: .firstTab).viewWillAppear(false)
    XCTAssertTrue(sutCore.setupCalled)
  }

  func test_controller_has_rightAmountOfTabs_1() {
    let sutCore = TabBarCoreSpy()
    let sut = makeSUT(core: sutCore, startTab: .firstTab)

    XCTAssertEqual(sut.viewControllers?.count, 0)
  }

  func test_controller_has_rightAmountOfTabs_2() {
    let sutCore = TabBarCoreSpy()
    let sut = makeSUT(core: sutCore, startTab: .firstTab)

    sut.viewWillAppear(false)

    XCTAssertEqual(sut.viewControllers?.count, 3)
  }
}

class TabBarControllerTests: XCTestCase {
  func makeSUT(core: TabBarCoreType, startTab: ApplicationTab) -> TabBarController {
    TabBarController(core: core, startTab: startTab)
  }
}

final class TabBarCoreSpy: TabBarCoreType {
  var setupCalled = false

  func viewWillAppear() {
    setupCalled = true
  }
}
