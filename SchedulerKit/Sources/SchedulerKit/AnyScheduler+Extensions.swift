//  AnyScheduler+Extensions.swift
//  SchedulerKit
//  Created by Ilya Sakalou on 02/01/2025.

import Combine
import Foundation

public extension AnyScheduler where S: DispatchQueue {
  static var main: AnyScheduler<DispatchQueue> {
    DispatchQueue.main.eraseToAnyScheduler()
  }

  static func global(qos: DispatchQoS.QoSClass = .default) -> AnyScheduler<DispatchQueue> {
    DispatchQueue.global(qos: qos).eraseToAnyScheduler()
  }
}
