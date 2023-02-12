//
//  APIClientTests.swift
//  Created by Ilya SAKALOU on 12/02/2023.
//

import XCTest
@testable import N_Plate

// MARK: - Instantiation
extension NetworkManagerTests {
  func test_execute_calls_networkSerice() {
    let networkServiceStub = NetworkServiceStub()
    let sut = makeSUT(networkService: networkServiceStub)

    sut.execute(NetworkRequest(path: "")) { _ in }

    XCTAssertEqual(networkServiceStub.log, [.didCallRequest])
  }

  func test_stubbed_client_execute_calls_networkSerice() {
    let networkServiceStub = NetworkServiceStub()
    let sut = makeStubbedSUT(networkService: networkServiceStub)

    sut.execute(NetworkRequest(path: "")) { _ in }

    XCTAssertEqual(networkServiceStub.log, [.didCallRequest])
  }
}

class NetworkManagerTests: XCTestCase {
  func makeSUT(networkService: NetworkService = DefaultNetworkService()) -> APIClient {
    APIClient(networkService: networkService)
  }

  func makeStubbedSUT(networkService: NetworkService = DefaultNetworkService()) -> StubbedAPIClient {
    StubbedAPIClient(networkService: networkService)
  }
}
