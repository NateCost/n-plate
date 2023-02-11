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
  func execute(_ request: RequestType, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    completion(.success(Data()))
  }
}
