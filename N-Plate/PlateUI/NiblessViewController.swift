//
//  NiblessViewController.swift
//  Created by Ilya Sakalou on 30/10/2021.
//

import UIKit

open class NiblessViewController: UIViewController {
  @available(
    *, unavailable,
    message: """
    Loading this view controller from a nib or storyboards is unsupported, \
    please use initializer with parameters instead.
    """
  )

  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  @available(
    *, unavailable,
    message: """
    Loading this view controller from a nib or storyboards is unsupported, \
    please use initializer with parameters instead.
    """
  )
  public required init?(coder aDecoder: NSCoder) {
    fatalError(
      """
      Loading this view controller from a nib or storyboards is unsupported, \
      please use initializer with parameters instead.
      """
    )
  }

  public init() {
    super.init(nibName: nil, bundle: nil)
  }
}
