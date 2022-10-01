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

  func test_execute_request_executes_apiCompletion() {
      let result1 = Data(base64Encoded: "2121")!
      let sut = makeSUT(apiProvider: NetworkAPIProvider())
      var testResult: Result<Data, NetworkError> = .failure(.connectionError)

      sut.execute(request: NetworkRequestSpy()) { _ in
        testResult = .success(result1)
      }

      XCTAssertEqual(testResult, .success(try XCTUnwrap(result1)))
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
