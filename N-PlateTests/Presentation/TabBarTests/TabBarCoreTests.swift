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
    let sut = makeSUT()

    var captured: [Int] = []
    sut.currentTabIndex
      .sink { captured.append($0) }
      .store(in: &cancellables)

    XCTAssertTrue(sut.needSetup)
    XCTAssertEqual(sut.currentTab.value, .firstTab)
    XCTAssertEqual(captured.last, ApplicationTab.firstTab.rawValue)
  }

  func test_instantiation_2() {
    let sut = makeSUT(initialTab: .secondTab)
    
    var captured: [Int] = []
    sut.currentTabIndex
      .sink { captured.append($0) }
      .store(in: &cancellables)

    XCTAssertTrue(sut.needSetup)
    XCTAssertEqual(sut.currentTab.value, .secondTab)
    XCTAssertEqual(captured.last, ApplicationTab.secondTab.rawValue)
  }
}
// MARK: - Logics
extension TabBarCoreTests {
  func test_setup_called_once() {
    let sut = makeSUT()
    sut.viewWillAppear()
    XCTAssertFalse(sut.needSetup)
  }

  func test_setup_called_twice() {
    let sut = makeSUT()
    sut.viewWillAppear()
    sut.viewWillAppear()
    XCTAssertEqual(sut.setupCalledCount, 1)
  }
}
// MARK: - TabBarCoreTests
class TabBarCoreTests: XCTestCase {
  var cancellables: Set<AnyCancellable> = []

  func makeSUT(initialTab: ApplicationTab = .firstTab) -> TabBarCoreSpy {
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

  override init(initialTab: ApplicationTab = .firstTab) {
    super.init(initialTab: initialTab)
  }
}
