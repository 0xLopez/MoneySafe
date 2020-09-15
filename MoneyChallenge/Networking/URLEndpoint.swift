//
//  URLEndpoint.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

protocol URLEndpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var header: [String: String] { get }
    var timeout: TimeInterval { get }
}

extension URLEndpoint {
    var timeout: TimeInterval {
        20
    }
}

extension URLEndpoint {
    func getRequest(for baseUrl: URL) -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = body
        urlRequest.allHTTPHeaderFields = header
        urlRequest.timeoutInterval = timeout
        return urlRequest
    }
}
