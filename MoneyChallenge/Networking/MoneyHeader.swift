//
//  HTTPHeader.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

enum HTTPHeader {
    case defaultHeader
    case authorizationHeader
    
    enum Parameter: String {
        case apiVersion
        case appId = "AppId"
        case appVersion
        case authorizationToken = "Authorization"
        case contentType = "Content-Type"
    }
    
    private var defaultHeader: [String: String] {
        return [
            Parameter.apiVersion.rawValue: "3.0.0",
            Parameter.appId.rawValue: "8cb2237d0679ca88db6464",
            Parameter.appVersion.rawValue: "7.10.0",
            Parameter.contentType.rawValue: "application/json"
        ]
    }
    private var authorizationToken: String {
        return "bearer " + ""
    }
    
    var value: [String: String] {
        var header = defaultHeader
        if case .authorizationHeader = self {
            header[Parameter.authorizationToken.rawValue] = authorizationToken
        }
        return header
    }
}
