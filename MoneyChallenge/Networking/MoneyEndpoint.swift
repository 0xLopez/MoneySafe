//
//  MoneyEndpoint.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

enum MoneyEndpoint: URLEndpoint {
    case login(UserCredentials)
    case products
    
    
    var path: String {
        switch self {
        case .login:
            return "/users/login"
        case .products:
            return "/investorproducts"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .products:
            return .get
        }
    }
    
    var body: Data? {
        switch self {
        case .login(let userCredentials):
            return try? JSONEncoder().encode(userCredentials)
        case .products:
            return nil
        }
    }
    
    var header: [String : String] {
        switch self {
        case .login:
            return HTTPHeader.defaultHeader.value
        case .products:
            return HTTPHeader.authorizationHeader.value
        }
    }
}
