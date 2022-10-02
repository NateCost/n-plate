//
//  OffersViewController.swift
//  Created by Ilya Sakalou on 05/11/2021.
//

import UIKit

final class OffersViewController: NiblessViewController {
  private let core: OffersCoreType

  init(core: OffersCoreType) {
    self.core = core
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .brown
  }
}
