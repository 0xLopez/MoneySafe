//
//  FakeEndpoint.swift
//  MoneyChallengeTests
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation
@testable import MoneyChallenge

struct FakeEndpoint: URLEndpoint {
    let path = "fakePath"
    let method: HTTPMethod = .post
    let body: Data? = "Some body".data(using: .utf8)
    let header = ["Some header": "Header value"]
    let timeout: TimeInterval = 20
}
