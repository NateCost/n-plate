//
//  TabBarCore.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import Foundation
import Combine

protocol TabBarCoreType {
  func viewWillAppear()
  var currentTabIndexPublisher: Published<Int>.Publisher { get }
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
  
  @Published var currentTabIndex = 0
  var currentTabIndexPublisher: Published<Int>.Publisher { $currentTabIndex }

  init(initialTab: ApplicationTab) {
    currentTab = initialTab
  }
}
