//
//  Accessible+Methods.swift
//  ios-base
//
//  Created by Ahmet on 24.05.2022.
//

import Foundation

enum AppError: Error {
    case httpError
    case decodingError
    case custom(value: Error)
}

extension Accessible {
    
    func fetchResponse<V: Decodable>(
        _ type: V.Type, _ completion: @escaping (Result<V, AppError>) -> Void) {
            
            let logText = (urlRequest.url?.absoluteString ?? .empty) + .newline +
            (urlRequest.allHTTPHeaderFields?.description ?? .empty)
            
            LogUtility.shared.log(logStyle: .Request, title: logText)
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                LogUtility.shared.log(logStyle: .Response, title: data?.toPrettyJsonString as Any)
                
                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(.custom(value: error)))
                    }
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.httpError))
                    return
                }
                
                DispatchQueue.main.async {
                    do {
                        guard let data = data else {
                            preconditionFailure("No error was received but we also don't have data...")
                        }
                        
                        let decodedObject = try JSONDecoder().decode(V.self, from: data)
                        completion(.success(decodedObject))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
        }
    
    func asycFetch<T: Decodable> (_ type: T.Type) async throws -> T {
        
        let logText = (urlRequest.url?.absoluteString ?? .empty) + .newline +
        (urlRequest.allHTTPHeaderFields?.description ?? .empty)
        
        LogUtility.shared.log(logStyle: .Request, title: logText)
        
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppError.httpError
        }
        
        do {
            LogUtility.shared.log(logStyle: .Response, title: data.toPrettyJsonString as Any)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw AppError.decodingError
        }
    }
    
}
