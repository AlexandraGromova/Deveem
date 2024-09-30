//
//  RealmProductsModel.swift
//  Deveem
//
//  Created by Sasha on 27.09.2024.
//

import Foundation
import RealmSwift

class ProductRealm: Object, ObjectKeyIdentifiable, Codable, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var price: Float
    @Persisted var productDescription: String
    @Persisted var category: CategoryRealm
    @Persisted var image: String
    @Persisted var rating: RatingRealm?
    
    convenience init(id: Int, title: String, price: Float, productDescription: String, category: CategoryRealm, image: String, rating: RatingRealm) {
        self.init()
        self.id = id
        self.title = title
        self.price = price
        self.productDescription = productDescription
        self.category = category
        self.image = image
        self.rating = rating
    }
    
    static func map(_ product: Product) -> ProductRealm  {
        return ProductRealm(id: product.id,
                            title: product.title,
                            price: product.price,
                            productDescription: product.description,
                            category: CategoryRealm(rawValue: product.category.rawValue) ?? .electronics,
                            image: product.image,
                            rating: RatingRealm(rate: product.rating?.rate ?? 0, count: product.rating?.count ?? 0))
    }
}

enum CategoryRealm: String, PersistableEnum, Codable, CaseIterable {
    case all = "all"
    case womenClothing = "women's clothing"
    case menClothing = "men's clothing"
    case jewelery = "jewelery"
    case electronics = "electronics"
}

class RatingRealm: Object, Codable {
    @Persisted var rate: Float
    @Persisted var count: Int
    convenience init(rate: Float, count: Int) {
        self.init()
        self.rate = rate
        self.count = count
    }
}
