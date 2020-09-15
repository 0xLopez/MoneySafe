//
//  NetworkClient.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import Foundation

class NetworkClient {
    
    let baseUrl: URL
    let session: URLSession
    private let goodResponse = 200...299
    private var dataTask: URLSessionDataTask?
    static let baseUrlString = "https://api-test02.moneyboxapp.com"
    static let shared = NetworkClient(urlString: NetworkClient.baseUrlString)
    
    init(urlString: String, session: URLSession = .shared) {
        guard let baseUrl = URL(string: urlString) else {
            preconditionFailure("The url is not valid")
        }
        self.baseUrl = baseUrl
        self.session = session
    }
    
    func sendCodableRequest<T: Codable>(for endpoint: MoneyEndpoint, completion: @escaping (Result<T, APIError>) -> Void) {
        sendRequest(for: endpoint) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let parsedData = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(parsedData))
                } else {
                    completion(.failure(.decodingFailure))
                }
            }
        }
    }
    
    private func sendRequest(for endpoint: MoneyEndpoint, completion: @escaping (Result<Data, APIError>) -> Void){
        let request = endpoint.getRequest(for: baseUrl)
        dataTask?.cancel()
        dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                guard let `self` = self else {
                    return
                }
                if let error = error {
                    completion(.failure(.genericError(error)))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, self.goodResponse.contains(httpResponse.statusCode) else {
                    completion(.failure(.badResponse))
                    return
                }
                guard let data = data else {
                    completion(.failure(.emptyData))
                    return
                }
                completion(.success(data))
            }
        }
        dataTask?.resume()
    }
}

