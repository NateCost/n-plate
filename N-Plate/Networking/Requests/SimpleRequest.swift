//
//  SimpleRequest.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import Foundation

class SimpleNetworkRequest: RequestType {}

enum NetworkError: Error, Equatable {
  case connectionError
}
