//
//  NetworkRequestTests.swift
//  Created by Ilya SAKALOU on 12/02/2023.
//

import XCTest
@testable import N_Plate

final class NetworkRequestTests: XCTestCase {
  func test_urlRequest_builds_properly() {
    let path = "http://www.someurl.com/"
    let networkRequest = NetworkRequest(path: path)
    XCTAssertEqual(networkRequest.urlRequest!.url, URL(string: path))
  }
}
