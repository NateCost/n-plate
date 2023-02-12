//
//  NetworkService.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import Foundation

protocol NetworkService {
  typealias Response = (data: Data?, urlResponse: URLResponse?, error: Error?)
  func request(urlRequest: URLRequest, completion: @escaping (Response) -> Void)
}

final class DefaultNetworkService: NetworkService {
  func request(urlRequest: URLRequest, completion: @escaping (Response) -> Void) {
    URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
      completion((data, response, error))
    }).resume()
  }
}
