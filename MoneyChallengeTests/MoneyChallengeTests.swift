//
//  URLEndpointTests.swift
//  MoneyChallengeTests
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import XCTest
@testable import MoneyChallenge

class URLEndpointTests: XCTestCase {

    let sut: URLEndpoint = FakeEndpoint()
    var request: URLRequest!
    var url: URL {
        guard let baseUrl = URL(string: "https://www.example.com") else {
            preconditionFailure("Bar url")
        }
        return baseUrl
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        request = sut.getRequest(for: url)
    }

    override func tearDownWithError() throws {
        request = nil
        try super.tearDownWithError()
    }

    // MARK: - Property Declaration
    func testURLEndpoint_declaresPath() {
        _ = sut.path
    }
    
    func testURLEndpoint_declaresMethod() {
        _ = sut.method
    }
    
    func testURLEndpoint_declaresBody() {
        _ = sut.body
    }
    
    func testURLEndpoint_declaresHeader() {
        _ = sut.header
    }
    
    func testURLEndpoint_declaresTimeout() {
        _ = sut.timeout
    }
    
    // MARK: - Request
    func testGetRequest_setsPath() {
        // given
        let expectedPath = sut.path
        
        // then
        XCTAssertEqual(expectedPath, request.url?.lastPathComponent)
    }
    
    func testGetRequest_setsHttpMethod() {
        // given
        let expectedMethod = sut.method.rawValue
        
        // then
        XCTAssertEqual(expectedMethod, request.httpMethod)
    }
    
    func testGetRequest_setsHeader() {
        // given
        let expectedHeader = sut.header
        
        // then
        XCTAssertEqual(expectedHeader, request.allHTTPHeaderFields)
    }
    
    func testGetRequest_setsTimeoutInterval() {
        // given
        let expectedTimeout = sut.timeout
        
        // then
        XCTAssertEqual(expectedTimeout, request.timeoutInterval)
    }
}
