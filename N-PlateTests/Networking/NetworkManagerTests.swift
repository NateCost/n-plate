//
//  NetworkManagerTests.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import XCTest
@testable import N_Plate
import SwiftUI

// MARK: - Instantiation
extension NetworkManagerTests {
  func test_execute_request_calls_execute() {
    let sut = makeSUT(apiProvider: NetworkAPIProvider())
    var completed = false

    sut.execute(request: NetworkRequestSpy()) { _ in
      completed = true
    }

    XCTAssertTrue(completed)
  }
}

class NetworkManagerTests: XCTestCase {
  func makeSUT<SomeAPIProvider: APIProvider>(
    apiProvider: SomeAPIProvider
  ) -> NetworkManager<SomeAPIProvider> {
    NetworkManager(apiProvider: apiProvider)
  }
}
// MARK: - NetworkRequestSpy
private class NetworkRequestSpy: RequestType {}
