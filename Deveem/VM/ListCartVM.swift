//
//  ListCartVM.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import Foundation

class ListCartVM: ObservableObject {
    
    @Published var products: [ProductRealm] = []
    
    init() {
        products = getCartProducts()
    }
    
    private func getCartProducts() -> [ProductRealm] {
        let decoder = JSONDecoder()
        guard let savedCart = UserDefaults.standard.array(forKey: "cart") as? [Data] else {
            return []
        }
        return savedCart.compactMap { data in
            return try? decoder.decode(ProductRealm.self, from: data)
        }
    }
}
