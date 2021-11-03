//
//  TabBarControllerTests.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import XCTest
import UIKit
import SchedulerKit
import SchedulerKitTestUtils
@testable import N_Plate

// MARK: - Instantiation
extension TabBarControllerTests {
  func test_controller_persists_core() {
    let sutCore = TabBarCoreSpy(initialTab: .firstTab)
    makeSUT(core: sutCore, startTab: .firstTab).viewWillAppear(false)
    XCTAssertTrue(sutCore.setupCalled)
  }

  func test_controller_has_rightAmountOfTabs_1() {
    let sutCore = TabBarCoreSpy(initialTab: .firstTab)
    let sut = makeSUT(core: sutCore, startTab: .firstTab)

    XCTAssertEqual(sut.viewControllers?.count ?? 0, 0)
  }

  func test_controller_has_rightAmountOfTabs_2() {
    let sutCore = TabBarCoreSpy(initialTab: .firstTab)
    let sut = makeSUT(core: sutCore, startTab: .firstTab)

    sut.viewWillAppear(false)

    XCTAssertEqual(sut.viewControllers?.count, 3)
  }
}
// MARK: - Logic
extension TabBarControllerTests {
  func test_controller_change_currentControllerIndex_1() {
    let sutCore = TabBarCoreSpy(initialTab: .firstTab)
    let sut = makeSUT(core: sutCore, startTab: .firstTab)
    sut.viewWillAppear(false)

    sutCore.currentTab.send(.secondTab)

    XCTAssertEqual(sut.selectedIndex, 1)
  }

  func test_controller_change_currentControllerIndex_2() {
    let sutCore = TabBarCoreSpy(initialTab: .firstTab)
    let sut = makeSUT(core: sutCore, startTab: .firstTab)
    sut.viewWillAppear(false)

    sutCore.currentTab.send(.thirdTab)

    XCTAssertEqual(sut.selectedIndex, 2)
  }
}

class TabBarControllerTests: XCTestCase {
  let scheduler: TestScheduler = .init()

  func makeSUT(core: TabBarCoreType, startTab: ApplicationTab) -> TabBarController {
    TabBarController(core: core, startTab: startTab, scheduler: scheduler.eraseToAnyScheduler())
  }
}
