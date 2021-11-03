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
  let currentTab: CurrentValueSubject<ApplicationTab, Never>
  lazy var currentTabIndex: AnyPublisher<Int, Never> = currentTab.map(\.rawValue).erased
  private var cancellables: Set<AnyCancellable> = []

  init(initialTab: ApplicationTab) {
    currentTab = CurrentValueSubject<ApplicationTab, Never>(initialTab)
  }
}
