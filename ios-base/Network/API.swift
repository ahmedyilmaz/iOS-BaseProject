//
//  API.swift
//  ios-base
//
//  Created by Ahmet on 24.05.2022.
//

import Foundation

enum API {
    
    static var baseUrlString: String {
        return "https://apiurl.com"
    }
    
    static let headers: [String : String] = [ "Platform":"iOS",
                                              "Build": "30"]
}

extension API {
    static func getURL(with trail: String) -> URL {
        URL(forceString: "\(baseUrlString)/\(trail)")
    }
}
