//
//  TabBarCore.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import Foundation
import Combine

enum ApplicationTab: Int, Equatable, CaseIterable {
  case firstTab
  case secondTab
  case thirdTab
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

  let currentTabIndex = CurrentValueSubject<Int, Never>(0)

  init(initialTab: ApplicationTab) {
    currentTab = initialTab
  }
}
