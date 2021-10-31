//
//  TabbarViewController.swift
//  Created by Ilya Sakalou on 31/10/2021.
//

import UIKit

enum ApplicationTab: Int, Equatable, CaseIterable {
  case firstTab
  case secondTab
  case thirdTab
}

final class TabBarController: UITabBarController {
  let startIndex = ApplicationTab.secondTab
  private let core: TabBarCoreType

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
      fatalError("Loading this view controller from a nib or storyboards is unsupported")
  }

  init(core: TabBarCoreType) {
    self.core = core
    super.init(nibName: nil, bundle: nil)
  }
}
