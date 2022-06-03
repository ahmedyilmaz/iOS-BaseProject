//
//  HomeService.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//

import Foundation

extension API {
    
    enum Home: Accessible {
        case getList(queryItems: [String: String])
        case getProductList(url: URL)
        
        var urlRequest: URLRequest {
            switch self {
            case .getList(let queryItems):
                return getRequest(url: API.getURL(with: "lorem-ipsum/dolor/sitamet"),
                                  queryItems: queryItems,
                                  headers: API.headers)
                
            case let .getProductList(url):
                return getRequest(url: url)
            }
        }
    }
    
}
