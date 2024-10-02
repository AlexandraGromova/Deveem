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
    
    func removeProduct(product: ProductRealm) {
        guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
        products.remove(at: index)
        updateCartProducts()
    }
    
    func removeProducts() {
        products.removeAll()
        UserDefaults.standard.removeObject(forKey: "cart")
    }
    
    private func updateCartProducts() {
        let encoder = JSONEncoder()
        let encodedProducts = products.compactMap { try? encoder.encode($0) }
        UserDefaults.standard.set(encodedProducts, forKey: "cart")
    }
}
