//
//  SecondTabViewController.swift
//  Created by Ilya Sakalou on 05/11/2021.
//

import UIKit

final class SecondTabViewController: NiblessViewController {
  private let core: SecondTabCoreType

  init(core: SecondTabCoreType) {
    self.core = core
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }
}
