//
//  NetworkManagerTests.swift
//  Created by Ilya Sakalou on 10/11/2021.
//

import XCTest
@testable import N_Plate

// MARK: - Instantiation
extension NetworkManagerTests {
  func test_execute_request_calls_execute() {
    let sut = makeSUT()
    let testRequest = NetworkRequestSpy()
    var completed = false

    sut.execute(request: testRequest) { _ in
      completed = true
    }

    XCTAssertTrue(completed)
  }
}

class NetworkManagerTests: XCTestCase {
  func makeSUT(apiProvider: APIProvider = NetworkAPIProvider()) -> NetworkManager {
    NetworkManager(apiProvider: apiProvider)
  }
}

private class NetworkRequestSpy: RequestType {}
