//
//  TabBarCore.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import Foundation

protocol TabBarCoreType {
  func viewWillAppear()
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

  init(initialTab: ApplicationTab) {
    currentTab = initialTab
  }
}
