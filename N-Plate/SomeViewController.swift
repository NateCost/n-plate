//
//  SomeViewController.swift
//  Created by Ilya Sakalou on 30/10/2021.
//

import UIKit

protocol SomeViewModelType {}

final class SomeViewModel: SomeViewModelType {}

final class SomeViewController: NiblessViewController {
  private let viewModel: SomeViewModelType

  init(viewModel: SomeViewModelType) {
    self.viewModel = viewModel
    super.init()
  }
}
