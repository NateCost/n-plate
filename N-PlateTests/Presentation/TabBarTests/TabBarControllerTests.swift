//  TabBarControllerTests.swift
//  Created by Ilya Sakalou on 31/10/2021.

import XCTest
import UIKit
import SchedulerKitTestUtils
@testable import N_Plate

// MARK: - Instantiation
extension TabBarControllerTests {
  func test_controller_persists_core() {
    let sutCore = TabBarCoreSpy()
    makeSUT(core: sutCore).viewWillAppear(false)
    XCTAssertTrue(sutCore.setupCalled)
  }

  func test_controller_has_noTabs_beforeSetup() {
    let sutCore = TabBarCoreSpy()
    let sut = makeSUT(core: sutCore)

    XCTAssertEqual(sut.viewControllers, nil)
  }

  func test_controller_has_rightAmountOfTabs_afterSetup() {
    let sutCore = TabBarCoreSpy()
    let sut = makeSUT(core: sutCore)

    sut.viewWillAppear(false)

    XCTAssertEqual(sut.viewControllers!.count, 3)
  }
}
// MARK: - Logic
extension TabBarControllerTests {
  func test_controller_change_currentControllerIndex_1() {
    let sutCore = TabBarCoreSpy()
    let sut = makeSUT(core: sutCore)
    sut.viewWillAppear(false)

    sutCore.currentTab.send(.secondTab)

    XCTAssertEqual(sut.selectedIndex, ApplicationTab.secondTab.rawValue)
  }

  func test_controller_change_currentControllerIndex_2() {
    let sutCore = TabBarCoreSpy()
    let sut = makeSUT(core: sutCore)
    sut.viewWillAppear(false)

    sutCore.currentTab.send(.offersTab)

    XCTAssertEqual(sut.selectedIndex, ApplicationTab.offersTab.rawValue)
  }
}

class TabBarControllerTests: XCTestCase {
  let scheduler = TestScheduler()

  func makeSUT(core: TabBarCoreType) -> TabBarController {
    TabBarController(core: core, scheduler: scheduler.eraseToAnyScheduler())
  }
}
