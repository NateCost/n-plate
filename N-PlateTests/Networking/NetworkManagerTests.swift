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

  func test_execute_request_success_1() {
    let sut = makeSUT(apiProvider: NetworkAPIProvider())
    var testResult: Result<Data, NetworkError> = .failure(.connectionError)

    sut.execute(request: NetworkRequestSpy()) { result in
      testResult = result
    }

    XCTAssertEqual(testResult, .success(Data()))
  }

  func test_execute_request_success_2() {
      let result = Data(base64Encoded: "2121")
      let sut = makeSUT(apiProvider: NetworkAPIProvider())
      var testResult: Result<Data, NetworkError> = .failure(.connectionError)

      sut.execute(request: NetworkRequestSpy()) { result in
        testResult = result
      }

      XCTAssertEqual(testResult, .success(try XCTUnwrap(result)))
  }
}

class NetworkManagerTests: XCTestCase {
  func makeSUT<SomeAPIProvider: APIProvider>(
    apiProvider: SomeAPIProvider
  ) -> NetworkManager<SomeAPIProvider> {
    NetworkManager(apiProvider: apiProvider)
  }
}

private class NetworkRequestSpy: RequestType {}
