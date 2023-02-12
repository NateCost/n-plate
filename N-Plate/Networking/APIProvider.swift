//
//  APIProvider.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import Foundation

protocol APIProvider {
  associatedtype ErrorType: Error
  func execute(_ request: RequestType, completion: @escaping (Result<Data, ErrorType>) -> Void)
}

final class NetworkAPIProvider: APIProvider {
  let networkService: NetworkService

  init(networkService: NetworkService) {
    self.networkService = networkService
  }

  func execute(_ request: RequestType, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    networkService.request(urlRequest: request.urlRequest) { _, _, _ in

    }
  }
}
