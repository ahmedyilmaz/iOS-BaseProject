//
//  LogUtility.swift
//  ios-base
//
//  Created by Ahmet on 24.05.2022.
//

import Foundation

final class LogUtility {
    
    static let shared = LogUtility()
    
    init() { }
    
    func log(logStyle:LogStyle = .Other, title: Any) {
        print("-------\n")
        print("\(logStyle.rawValue) - Start\n")
        print("\(title)\n")
        print("\(logStyle.rawValue) - End\n")
    }
}

internal enum LogStyle: String {
    case Config = "⚙️ ⚙️ ⚙️ -> Config"
    case Response = "🎁 🎁 🎁 -> Response Header"
    case ResponseJson = "🧬 🧬 🧬 -> Response Data"
    case Request = "🙈 🙉 🙊 -> Request"
    case RequestHeader = "✉️ ✉️ ✉️ -> Request Header"
    case RequestBody = "⚔️⚔️⚔️ -> Request Body"
    case Error = "🧨 🧨 🧨 -> Error Fire in The Hole"
    case Important = "🔥 🔥 🔥 -> Take this point"
    case Other = "⚠️ ⚠️ ⚠️ -> Other"
}

