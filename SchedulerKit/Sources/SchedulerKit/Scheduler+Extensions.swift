//  Scheduler+Extensions.swift
//  SchedulerKit
//  Created by Ilya Sakalou on 02/01/2025.

import Combine
import Foundation

public extension Scheduler {
  func eraseToAnyScheduler<S: Scheduler>() -> AnyScheduler<S> where S.SchedulerOptions == SchedulerOptions, S.SchedulerTimeType == SchedulerTimeType {
    AnyScheduler(scheduler: self)
  }
}
