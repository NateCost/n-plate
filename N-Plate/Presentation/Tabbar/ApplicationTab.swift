//
//  ApplicationTab.swift
//  Created by Ilya Sakalou on 05/11/2021.
//

import UIKit

enum ApplicationTab: Int, Equatable, CaseIterable {
  case firstTab
  case secondTab
  case thirdTab

  func getViewController() -> UIViewController {
    switch self {
    case .firstTab:
      return FirstTabViewController(core: FirstTabCore())
    case .secondTab:
      return SecondTabViewController(core: SecondTabCore())
    case .thirdTab:
      return OffersViewController(core: OffersCore())
    }
  }

  func getNavigationController() -> UINavigationController {
    let navigation = UINavigationController()
    let viewController = getViewController()

    navigation.viewControllers = [viewController]
    let tabbarItem = UITabBarItem(title: "TEXT", image: nil, selectedImage: nil)

    navigation.tabBarItem = tabbarItem

    return navigation
  }
}
