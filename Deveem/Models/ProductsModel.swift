//
//  ProductsModel.swift
//  Deveem
//
//  Created by Sasha on 26.09.2024.
//

import Foundation

typealias Products = [Product]

struct Product: Identifiable, Codable {
    var id: Int
    var title: String
    var price: Float
    var description: String
    var category: Category
    var image: String
    var rating: Rating?
}

enum Category: String, Codable, CaseIterable {
    case womenClothing = "women's clothing"
    case menClothing = "men's clothing"
    case jewelery = "jewelery"
    case electronics = "electronics"
}

struct Rating: Codable {
    var rate: Float
    var count: Int
}
