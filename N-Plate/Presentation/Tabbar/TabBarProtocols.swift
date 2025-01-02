//  TabBarProtocols.swift
//  Created by Ilya Sakalou on 03/11/2021.

import Foundation
import Combine
import SchedulerKit

protocol TabBarCoreType {
  func viewWillAppear()
  var currentTabIndex: AnyPublisher<Int, Never> { get }
}
