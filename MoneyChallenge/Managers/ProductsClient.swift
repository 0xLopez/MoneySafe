//
//  ProductsClient.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

class ProductsClient {
    static let shared = ProductsClient()
    
    private init() { }
    
    func getInvestorProduts(completion: @escaping (Result<ProductsInfo, APIError>) -> Void) {
        NetworkClient.shared.sendCodableRequest(for: .products, completion: completion)
    }
}
