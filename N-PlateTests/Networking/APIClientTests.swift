//  APIClientTests.swift
//  Created by Ilya SAKALOU on 12/02/2023.

import XCTest
@testable import N_Plate

extension APIClientTests {
  func test_execute_calls_networkSerice() {
    let networkServiceStub = NetworkServiceStub()
    let sut = makeSUT(networkService: networkServiceStub)
    let path = "http://www.someurl.com/"

    sut.execute(NetworkRequest(path: path)) { _ in }

    XCTAssertEqual(networkServiceStub.log, [.didCallRequest])
  }

  func test_execute_fails_with_invalidRequest() {
    let networkServiceStub = NetworkServiceStub()
    let sut = makeSUT(networkService: networkServiceStub)
    var result: Result<Data, NetworkError>?

    sut.execute(NetworkRequest(path: "")) { result = $0 }

    XCTAssertEqual(networkServiceStub.log, [])
    if let result = result {
      XCTAssertEqual(result, .failure(.invalidRequest))
    } else {
      XCTFail()
    }
  }
}
// MARK: - Stubbed client tests
extension APIClientTests {
  func test_stubbed_client_holds_stubs() {
    let networkServiceStub = NetworkServiceStub()
    let sut = makeStubbedSUT(networkService: networkServiceStub)
    let stub = StubbedAPIClient.Stub(path: "http://www.someurl.com/", response: [:])

    sut.addStub(stub)

    XCTAssertEqual(sut.stubs.count, 1)
  }

  func test_stubbed_client_execute_calls_networkSerice() {
    let networkServiceStub = NetworkServiceStub()
    let sut = makeStubbedSUT(networkService: networkServiceStub)

    sut.execute(NetworkRequest(path: "http://www.someurl.com/")) { _ in }

    XCTAssertEqual(networkServiceStub.log, [.didCallRequest])
  }

  func test_stubbed_client_execute_fails_with_invalidRequest() {
    let networkServiceStub = NetworkServiceStub()
    let sut = makeStubbedSUT(networkService: networkServiceStub)
    var result: Result<Data, NetworkError>?

    sut.execute(NetworkRequest(path: "")) { result = $0 }

    XCTAssertEqual(networkServiceStub.log, [])
    if let result = result {
      XCTAssertEqual(result, .failure(.invalidRequest))
    } else {
      XCTFail()
    }
  }
}

final class APIClientTests: XCTestCase {
  func makeSUT(networkService: NetworkService = DefaultNetworkService()) -> APIClient {
    APIClient(networkService: networkService)
  }

  func makeStubbedSUT(networkService: NetworkService = DefaultNetworkService()) -> StubbedAPIClient {
    StubbedAPIClient(networkService: networkService)
  }
}
