//
//  Authenticator.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

class Authenticator {
    
    struct Constants {
        static let authorizationToken = "authorizationToken"
        static let userName = "userName"
    }
    
    static let shared = Authenticator()
    private let userDefaults = UserDefaults.standard
    
    var authorizationToken: String? {
        userDefaults.string(forKey: Constants.authorizationToken)
    }
    var userName: String? {
        userDefaults.string(forKey: Constants.userName)
    }
    
    private init() { }
    
    func login(userCredentials: UserCredentials, completion: @escaping (Result<Bool, APIError>) -> Void) {
        NetworkClient.shared.sendCodableRequest(for: .login(userCredentials)) { [weak self] (result: Result<UserData, APIError>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let userData):
                self?.userDefaults.set(userData.session.bearerToken, forKey: Constants.authorizationToken)
                self?.userDefaults.set(userData.user.firstName, forKey: Constants.userName)
                completion(.success(true))
            }
        }
    }
}
