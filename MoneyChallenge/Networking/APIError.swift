//
//  APIError.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badResponse
    case decodingFailure
    case emptyData
    case genericError(Error)
    
    var localizedDescription: String {
        "Something went wrong. Please try again later."
    }
}
