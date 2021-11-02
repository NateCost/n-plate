//
//  TabBarCore.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import Foundation

protocol TabBarCoreType {
  func viewWillAppear()
}

extension TabBarCore: TabBarCoreType {
  func viewWillAppear() {}

  private func setup() {}
}

class TabBarCore {
  var needSetup = true
  var currentTab: ApplicationTab

  init(initialTab: ApplicationTab) {
    currentTab = initialTab
  }
}
