//
//  AppContainer.swift
//  Deveem
//
//  Created by Sasha on 28.09.2024.
//

import Foundation
import Swinject

class AppContainer {
    
    static private let container = Container()
    
    static func setup() {
        container.register(RemoteSource.self) { r in
            RemoteSource()
        }
        container.register(LocalSource.self) { r in
            LocalSource()
        }
        container.register(ProductsRepository.self) { r in
            ProductsRepository(remoteSource: r.resolve(RemoteSource.self)!, localSource: r.resolve(LocalSource.self)!)
        }
        container.register(ListProductsVM.self) { r in
            ListProductsVM(repository: r.resolve(ProductsRepository.self)!)
        }
        container.register(SplashScreenVM.self) { r in
            SplashScreenVM(repository: r.resolve(ProductsRepository.self)!)
        }
        container.register(ListCartVM.self) { r in
            ListCartVM()
        }
    }
    
    static func resolve<T>(_ serviceType: T.Type) -> T {
        return container.resolve(serviceType)!
    }
}
