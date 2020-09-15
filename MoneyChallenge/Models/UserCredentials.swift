//
//  UserCredentials.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

struct UserCredentials: Codable {
    let email: String
    let password: String
    let id = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case password = "Password"
        case id = "Idfa"
    }
}
