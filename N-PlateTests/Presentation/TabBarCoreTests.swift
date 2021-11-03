//
//  TabBarCoreTests.swift
//  Created by Ilya Sakalou on 02/11/2021.
//

import XCTest
import UIKit
import Combine
@testable import N_Plate

// MARK: - Instantiation
extension TabBarCoreTests {
  func test_instantiation_1() {
    let sut = makeSUT(initialTab: .firstTab)
    var cancellables: Set<AnyCancellable> = []
    var someValues: [Int] = []

    sut.currentTabIndex
      .sink { value in
        someValues.append(value)
      }
      .store(in: &cancellables)

    XCTAssertTrue(sut.needSetup)
    XCTAssertEqual(sut.currentTab.value, .firstTab)
    XCTAssertEqual(someValues.last, 0)
  }

  func test_instantiation_2() {
    let sut = makeSUT(initialTab: .secondTab)
    var cancellables: Set<AnyCancellable> = []
    var someValues: [Int] = []

    sut.currentTabIndex
      .sink { value in
        someValues.append(value)
      }
      .store(in: &cancellables)

    XCTAssertTrue(sut.needSetup)
    XCTAssertEqual(sut.currentTab.value, .secondTab)
    XCTAssertEqual(someValues.last, 1)
  }
}
// MARK: - Logics
extension TabBarCoreTests {
  func test_setup_called_once() {
    let sut = makeSUT(initialTab: .firstTab)
    sut.viewWillAppear()
    XCTAssertFalse(sut.needSetup)
  }

  func test_setup_called_twice() {
    let sut = makeSUT(initialTab: .firstTab)
    sut.viewWillAppear()
    sut.viewWillAppear()
    XCTAssertEqual(sut.setupCalledCount, 1)
  }
}
// MARK: - TabBarCoreTests
class TabBarCoreTests: XCTestCase {
  func makeSUT(initialTab: ApplicationTab) -> TabBarCoreSpy {
    TabBarCoreSpy(initialTab: initialTab)
  }
}
// MARK: - TabBarCoreSpy
class TabBarCoreSpy: TabBarCore {
  var setupCalledCount = 0
  var setupCalled = false

  override func viewWillAppear() {
    super.viewWillAppear()
    setupCalled = true
  }

  override func setup() {
    super.setup()
    setupCalledCount += 1
  }
}
