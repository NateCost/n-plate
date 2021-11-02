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

extension TabBarController {
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      core.viewWillAppear()
      setup()
    }

    private func setup() {
      // tabBar.barTintColor = UIColor.white
      // tabBar.tintColor = R.color.tab_bar_text_selected()!

      viewControllers = [
        FirstTabViewController(core: FirstTabCore()),
        FirstTabViewController(core: FirstTabCore()),
        FirstTabViewController(core: FirstTabCore())
      ]
    }
}

final class TabBarController: UITabBarController {
  private let core: TabBarCoreType

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view controller from a nib or storyboards is unsupported")
  }

  init(core: TabBarCoreType, startTab: ApplicationTab) {
    self.core = core
    super.init(nibName: nil, bundle: nil)
  }
}
