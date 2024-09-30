//
//  SplashScreenVM.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import Foundation

class SplashScreenVM: ObservableObject {
    
    private let repository: ProductsRepository
    
    init(repository: ProductsRepository) {
        self.repository = repository
        repository.updateProducts()
    }
}
