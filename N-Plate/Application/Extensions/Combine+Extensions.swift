//
//  Combine+Extensions.swift
//  Created by Ilya Sakalou on 02/11/2021.
//

import Combine

extension Publisher where Failure == Never {
  func assign<Root: AnyObject>(
    to keyPath: ReferenceWritableKeyPath<Root, Output>,
    onWeak object: Root?
  ) -> AnyCancellable {
    sink { [weak object] value in
      object?[keyPath: keyPath] = value
    }
  }
}

extension Publisher {
  var erased: AnyPublisher<Self.Output, Self.Failure> {
    eraseToAnyPublisher()
  }
}
