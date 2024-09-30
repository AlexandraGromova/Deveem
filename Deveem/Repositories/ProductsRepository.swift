//
//  Repository.swift
//  Deveem
//
//  Created by Sasha on 27.09.2024.
//

import Foundation
import Combine

class ProductsRepository {
    
    private let remoteSource: RemoteSource
    private let localSource: LocalSource
    
    init(remoteSource: RemoteSource, localSource: LocalSource) {
        self.remoteSource = remoteSource
        self.localSource = localSource
    }
    
    func updateProducts() {
        Task {
            let products = await remoteSource.getAllProducts()
            await localSource.saveProducts(products: products)
        }
    }
    
    func getProductsPublisher() -> AnyPublisher<[ProductRealm], Never> {
        return localSource.getProductsPublisher()
    }
}
