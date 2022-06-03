//
//  Accessible.swift
//  ios-base
//
//  Created by Ahmet on 24.05.2022.
//

import Foundation

protocol Accessible {
    var urlRequest: URLRequest { get }
}

/// Request types to be passed as `URLRequest.httpMethod`.
public enum RequestType: String {
    case GET
    case POST
    case PUT
    case DELETE
}

extension Accessible {

     /**
      Returns GET or DELETE `URLRequest` with specified url and query item.
     - parameter url:         `URL`.
     - parameter queryItems:  Query items to be appended to the url,
     eg, pageSize: 10 will be appended to url as &pageSize=10.
     - parameter headers:     HTTP headers.
     - parameter httpMethod:  HTTP method. (GET, DELETE)
     - returns: `URLRequest` with specified url and query item.
     */
    public func getRequest(url: URL,
                           queryItems: [String: String] = [:],
                           headers: [String: String] = [:],
                           httpMethod: RequestType = .GET) -> URLRequest {
        //TODO: throw exception when an unexpected http method is encountered
        let url = url.adding(parameters: queryItems)
        let request = getRequest(with: url,
                                 httpMethod: httpMethod,
                                 headers: headers,
                                 contentType: .json)
        return request
    }
    
    /**
        Returns POST, PUT or DELETE `URLRequest` with specified url and encodable body object.
        
        - parameter url:         `URL`.
        - parameter encodable:   Any object confirming `Encodable` to be used in `URLRequest.httpBody`.
        - parameter headers:     HTTP headers.
        - parameter httpMethod:  HTTP method. (DELETE, POST, PUT)
        - returns: `URLRequest` with specified url and encodable body object.
        */
       public func getRequest<T: Encodable>(url: URL,
                                            encodable data: T,
                                            headers: [String: String] = [:],
                                            httpMethod: RequestType = .POST) -> URLRequest {
           var request = getRequest(with: url,
                                    httpMethod: httpMethod,
                                    headers: headers,
                                    contentType: .json)
           do {
               request.httpBody = try JSONEncoder().encode(data)
           } catch {
               print(error)
           }
           return request
       }
    
    /**
     Returns `URLRequest` with specified url and httpMehthod.
     - parameter url:         `URL` of the request.
     - parameter httpMethod:  HTTP method of the reuest, either GET or POST.
     - parameter headers:     HTTP headers.
     - parameter contentType: Content-Type of the request.
     - returns: `URLRequest` with specified url and httpMehthod.
     */
    private func getRequest(with url: URL, httpMethod: RequestType,
                            headers: [String: String],
                            contentType: NetworkContentType) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        request.allHTTPHeaderFields = getHeaders(headers, contentType: contentType)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        return request
    }
    
    /// Returns default headers for used `URLRequest`s.
    private func getHeaders(_ headers: [String: String],
                            contentType: NetworkContentType) -> [String: String] {
        var heads = headers
        heads["Content-Type"] = contentType.rawValue
        return heads
    }
}


/// "Content-Type" values for network requests.
public enum NetworkContentType {
    /// Content type used when expecting response  in JSON format.
    case json
    case urlencoded
    case multipartFormData(String)
    
    var rawValue: String {
        switch self {
        case .json: return "application/json"
        case .urlencoded: return "application/x-www-form-urlencoded"
        case .multipartFormData(let boundary): return "multipart/form-data; boundary=\(boundary)"
        }
    }
}

