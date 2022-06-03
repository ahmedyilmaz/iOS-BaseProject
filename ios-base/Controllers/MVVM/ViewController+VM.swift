//
//  ViewController+VM.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//

import Foundation

class ViewControllerViewModel {
    
    init(){ }
    
    var productFetched: (([ProductsContent]?) -> ())?
    
    var products: [ProductsContent]? {
        didSet {
            productFetched?(products)
        }
    }
    
    func getProductList(url: URL) async throws -> [ProductsContent] {
        return try await API.Home.getProductList(url: url).asycFetch([ProductsContent].self)
    }
}
