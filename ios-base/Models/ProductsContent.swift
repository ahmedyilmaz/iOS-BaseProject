//
//  ProductsContent.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//

import Foundation

struct ProductsContent: Codable {
    let boutiqueId: Int?
    let brandName: String?
    let promotions: [String]?
    let newDiscountedPrice, discountedPrice: Double?
    let discountedPriceInfo: String?
    let promotionList, orderedPromotions: [OrderedPromotion]?
    let promotionMessage: String?
    let variants: [Variant]?
    let marketing: MarketingTools?
}

extension ProductsContent {
    
    // MARK: - Marketing
    struct MarketingTools: Codable {
        let adjust, campaignsAnalytics, criteo: String?
        let enhanced: Enhanced?
        let facebook: Facebook?
    }
    
    // MARK: - Variant
    struct Variant: Codable {
        let campaignId: Int?
        let listingId: String?
        let name: String?
        let variantId: Int?
        let value: String?
        let price: Price?
    }
    
    // MARK: - OrderedPromotion
    struct OrderedPromotion: Codable {
        let endsIn24Hours: Bool?
        let id: String?
        let shortname: String?
        let colorCode: String?
        let type: String?
        let name: String?
        let icon: String?
    }
}

extension ProductsContent.MarketingTools {
    
    // MARK: - Enhanced
    struct Enhanced: Codable {
        let dimension1, dimension2, dimension3, dimension4: String?
    }
    
    // MARK: - Facebook
    struct Facebook: Codable {
        let id, itemPrice, productBoutiqueid, productContentid: String?
        let productItemnumber, productListingid, productMerchantid, quantity: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case itemPrice = "item_price"
            case productBoutiqueid = "product_boutiqueid"
            case productContentid = "product_contentid"
            case productItemnumber = "product_itemnumber"
            case productListingid = "product_listingid"
            case productMerchantid = "product_merchantid"
            case quantity
        }
    }
}

extension ProductsContent.Variant {
    // MARK: - Price
    struct Price: Codable {
        let salePrice, marketPrice, newDiscountedPrice: Double?
        let mOriginalPrice: Int?
        let discountedPriceInfo: String?
    }
}
