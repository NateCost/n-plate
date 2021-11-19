//
//  NetworkManager.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import Foundation

class NetworkManager<DataProvider: APIProvider> {
  private let apiProvider: DataProvider

  init(apiProvider: DataProvider) {
    self.apiProvider = apiProvider
  }

  func execute(
    request: RequestType,
    completion: @escaping (Result<Data, DataProvider.ErrorType>) -> Void
  ) {
    apiProvider.execute(request, completion: completion)
  }
}
