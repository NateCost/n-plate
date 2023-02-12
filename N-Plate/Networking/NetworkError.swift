//
//  NetworkError.swift
//  Created by Ilya SAKALOU on 11/02/2023.
//

import Foundation

enum NetworkError: Error, Equatable {
  case noConnection
  case invalidRequest
}
