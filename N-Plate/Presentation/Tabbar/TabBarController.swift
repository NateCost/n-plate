//  TabbarViewController.swift
//  Created by Ilya Sakalou on 31/10/2021.

import UIKit
import Combine
import SchedulerKit

extension TabBarController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    core.viewWillAppear()
    setupBindings()
    setupUI()
  }

  private func setupBindings() {
    core.currentTabIndex
      .receive(on: scheduler)
      .assign(to: \.selectedIndex, onWeak: self)
      .store(in: &cancellables)
  }

  private func setupUI() {
    tabBar.backgroundColor = .brown
    tabBar.barTintColor = UIColor.white
    tabBar.tintColor = UIColor.black

    viewControllers = [
      ApplicationTab.agreementsTab.getNavigationController(),
      ApplicationTab.secondTab.getNavigationController(),
      ApplicationTab.offersTab.getNavigationController()
    ]
  }
}
// MARK: - TabBarController
final class TabBarController: UITabBarController {
  private let core: TabBarCoreType
  private var cancellables: Set<AnyCancellable> = []
  private let scheduler: DispatchQueueAnyScheduler

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view controller from a nib or storyboards is unsupported")
  }

  init(core: TabBarCoreType, scheduler: DispatchQueueAnyScheduler = .main) {
    self.core = core
    self.scheduler = scheduler
    super.init(nibName: nil, bundle: nil)
  }
}
