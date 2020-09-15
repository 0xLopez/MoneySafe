//
//  ProductsInfo.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

struct ProductsInfo: Codable {
    let totalValue: Double
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case totalValue = "TotalPlanValue"
        case products = "ProductResponses"
    }
}

struct Product: Codable {
    let planValue: Double
    let moneybox: Double
    let info: ProductInfo
    var name: String {
        info.friendlyName
    }
    
    enum CodingKeys: String, CodingKey {
        case planValue = "PlanValue"
        case moneybox = "Moneybox"
        case info = "Product"
    }
}

struct ProductInfo: Codable {
    let friendlyName: String
    
    enum CodingKeys: String, CodingKey {
        case friendlyName = "FriendlyName"
    }
}
