//  NetworkServiceStub.swift
//  Created by Ilya SAKALOU on 12/02/2023.

import Foundation
@testable import N_Plate

// MARK: - methods
extension NetworkServiceStub {
  func request(urlRequest: URLRequest, completion: @escaping (Response) -> Void) {
    log.append(.didCallRequest)
  }
}
// MARK: - NetworkServiceStub
final class NetworkServiceStub: NetworkService {
  var log: [LoggableAction] = []

  enum LoggableAction {
    case didCallRequest
  }
}
