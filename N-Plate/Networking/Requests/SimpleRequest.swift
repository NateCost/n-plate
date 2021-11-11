//
//  SimpleRequest.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import Foundation

protocol RequestType {
  func execute(completion: @escaping (Result<Data, Error>) -> Void)
}

class SimpleNetworkRequest: RequestType {
  func execute(completion: @escaping (Result<Data, Error>) -> Void) {
    completion(.failure(NetworkError.connection))
  }
}

enum NetworkError: Error {
  case connection
}
