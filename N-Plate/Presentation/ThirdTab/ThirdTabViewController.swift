//
//  ThirdTabViewController.swift
//  Created by Ilya Sakalou on 05/11/2021.
//

import UIKit

final class ThirdTabViewController: NiblessViewController {
  private let core: ThirdTabCoreType

  init(core: ThirdTabCoreType) {
    self.core = core
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .brown
  }
}
