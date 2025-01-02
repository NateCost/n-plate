//  AnyScheduler+Extensions.swift
//  SchedulerKitTestUtils
//  Created by Ilya Sakalou on 02/01/2025.

import Combine
import Foundation
import SchedulerKit

public extension AnyScheduler where S: DispatchQueue {
  static var test: AnyScheduler<DispatchQueue> {
    TestScheduler().eraseToAnyScheduler()
  }
}
