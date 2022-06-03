//
//  DataExtension.swift
//  ios-base
//
//  Created by Ahmet on 24.05.2022.
//

import Foundation

extension Data {
    /// To pretty string text for dictionary data objects
    var toPrettyJsonString: String {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return "No Response" }
        return String(prettyPrintedString).replacingOccurrences(of: "\\/", with: "/")
    }
}
