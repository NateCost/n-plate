//
//  TabBarCore.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import Foundation

protocol TabBarCoreType {
  func viewWillAppear()
}

extension TabBarCore: TabBarCoreType {
  func viewWillAppear() {
    setup()
  }

  private func setup() {
    needSetup = false
  }
}

class TabBarCore {
  var needSetup = true
  var currentTab: ApplicationTab

  init(initialTab: ApplicationTab) {
    currentTab = initialTab
  }
}
