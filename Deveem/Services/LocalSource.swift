//
//  LocalSource.swift
//  Deveem
//
//  Created by Sasha on 27.09.2024.
//

import Foundation
import RealmSwift
import Combine

class LocalSource {
    
    let realm = try! Realm()
    
    @MainActor
    func saveProducts(products: [Product]) async {
        do {
            try self.realm.write{
                let listProducts = products.map { product in
                    ProductRealm.map(product)
                }
                self.realm.add(listProducts, update: .all)
            }
        }
        catch {
            print("errorSaveProducts")
        }
    }
    func getProductsPublisher() -> AnyPublisher<[ProductRealm], Never> {
        return realm.objects(ProductRealm.self)
            .collectionPublisher
            .map { Array($0) }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
