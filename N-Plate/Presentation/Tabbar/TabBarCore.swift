//
//  TabBarCore.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import Foundation
import Combine

protocol TabBarCoreType {
  func viewWillAppear()
  var currentTabIndex: CurrentValueSubject<Int, Never> { get }
}

class TabBarCore: TabBarCoreType {
  func viewWillAppear() {
    if needSetup {
      setup()
    }
  }

  func setup() {
    needSetup = false
  }

  var needSetup = true
  var currentTab: ApplicationTab

  private(set) var currentTabIndex = CurrentValueSubject<Int, Never>(0)

  init(initialTab: ApplicationTab) {
    currentTab = initialTab
  }
}
