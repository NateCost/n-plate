//
//  APIProvider.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import Foundation

protocol APIProvider {
  func execute(_ request: RequestType, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkAPIProvider: APIProvider {
  func execute(_ request: RequestType, completion: @escaping (Result<Data, Error>) -> Void) {
    completion(.success(Data()))
  }
}
