//  ApplicationTab.swift
//  Created by Ilya Sakalou on 05/11/2021.

import UIKit

enum ApplicationTab: Int, Equatable, CaseIterable {
  case agreementsTab
  case secondTab
  case offersTab

  func getViewController() -> UIViewController {
    switch self {
    case .agreementsTab:
      return AgreementsViewController(core: AgreementsCore())
    case .secondTab:
      return SecondTabViewController(core: SecondTabCore())
    case .offersTab:
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
