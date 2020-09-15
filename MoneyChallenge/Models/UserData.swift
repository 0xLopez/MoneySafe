//
//  UserData.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

struct UserData: Codable {
    let session: Session
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case session = "Session"
        case user = "User"
    }
}

struct User: Codable {
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "FirstName"
        case lastName = "LastName"
    }
}

struct Session: Codable {
    let bearerToken: String
    
    enum CodingKeys: String, CodingKey {
        case bearerToken = "BearerToken"
    }
}
