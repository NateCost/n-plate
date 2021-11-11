//
//  NetworkManager.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import Foundation

class NetworkManager {
  private let apiProvider: APIProvider

  init(apiProvider: APIProvider) {
    self.apiProvider = apiProvider
  }

  func execute(request: RequestType, completion: @escaping (Result<Data, Error>) -> Void) {
    apiProvider.execute(request, completion: completion)
  }
}
