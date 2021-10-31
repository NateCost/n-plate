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
}
