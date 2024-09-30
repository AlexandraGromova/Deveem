//
//  ListProductsVM.swift
//  Deveem
//
//  Created by Sasha on 27.09.2024.
//

import Foundation
import Combine

class ListProductsVM: ObservableObject {
    
    @Published private var allProducts: [ProductRealm] = []
    @Published var categoryProducts: [ProductRealm] = []
    @Published var selectedCategory: CategoryRealm = .electronics
    
    private let repository: ProductsRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: ProductsRepository) {
        self.repository = repository
        observeProducts()
        $selectedCategory.sink { category in
            if category == .all {
                self.categoryProducts = self.allProducts
            } else {
                self.categoryProducts = self.allProducts.filter { $0.category == category }
            }
        }
        .store(in: &cancellables)
    }
    
    private func observeProducts() {
        repository.getProductsPublisher()
            .receive(on: DispatchQueue.main)
            .sink { value in
                self.allProducts = value
                self.selectedCategory = .all
            }
            .store(in: &cancellables)
    }
    
    func addToCart(product: ProductRealm) {
        let encoder = JSONEncoder()
        let unmanagedProduct = product.unmanagedCopy()
        do {
            let data = try encoder.encode(unmanagedProduct)
            var currentCart = UserDefaults.standard.array(forKey: "cart") as? [Data] ?? []
            currentCart.append(data)
            UserDefaults.standard.set(currentCart, forKey: "cart")
        } catch {
            print("Failed to encode product: \(error)")
        }
    }
}

