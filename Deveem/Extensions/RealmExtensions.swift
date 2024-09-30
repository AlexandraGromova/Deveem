//
//  RealmExtensions.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import Foundation

extension ProductRealm {
    func unmanagedCopy() -> ProductRealm {
        let unmanagedProduct = ProductRealm(id: self.id,
                                            title: self.title,
                                            price: self.price,
                                            productDescription: self.productDescription,
                                            category: self.category,
                                            image: self.image,
                                            rating: self.rating?.unmanagedCopy() ?? RatingRealm(rate: 0, count: 0))
        return unmanagedProduct
    }
}

extension RatingRealm {
    func unmanagedCopy() -> RatingRealm {
        return RatingRealm(rate: self.rate, count: self.count)
    }
}
