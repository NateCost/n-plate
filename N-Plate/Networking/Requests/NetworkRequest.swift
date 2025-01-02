//  NetworkRequest.swift
//  Created by Ilya Sakalou on 10/11/2021.

import Foundation

public struct NetworkRequest: RequestType {
  let path: String
  var method: Method = .get
  var headers: [String: String] = [:]
  var body: Data?

  var queryItems: [URLQueryItem]?
  var cachePolicy: URLRequest.CachePolicy?
  var timeout: TimeInterval?

  var urlRequest: URLRequest? {
    guard let url = URL(string: path) else { return nil }
    return URLRequest(url: url)
  }

  public init(path: String) {
    self.path = path
  }

  public enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
  }
}

protocol RequestType {
  var urlRequest: URLRequest? { get }
}
