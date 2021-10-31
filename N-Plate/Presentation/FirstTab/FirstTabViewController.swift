//
//  SomeViewController.swift
//  Created by Ilya Sakalou on 30/10/2021.
//

import UIKit

final class FirstTabViewController: NiblessViewController {
  private let core: FirstTabCoreType

  init(core: FirstTabCoreType) {
    self.core = core
    super.init()
  }
}
