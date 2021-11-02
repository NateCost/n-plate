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

class TabBarCoreTests: XCTestCase {
  func makeSUT(initialTab: ApplicationTab) -> TabBarCoreSpy {
    TabBarCoreSpy(initialTab: initialTab)
  }
}

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
