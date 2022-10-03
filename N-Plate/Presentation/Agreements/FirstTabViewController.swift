//
//  AgreementsViewController.swift
//  Created by Ilya Sakalou on 30/10/2021.
//

import UIKit

final class AgreementsViewController: NiblessViewController {
  private let core: AgreementsCoreType

  init(core: AgreementsCoreType) {
    self.core = core
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
  }
}
