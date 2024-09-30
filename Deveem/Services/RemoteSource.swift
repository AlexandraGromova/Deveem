//
//  RemoteSource.swift
//  Deveem
//
//  Created by Sasha on 26.09.2024.
//

import Foundation

class RemoteSource {
    
    let url = "https://fakestoreapi.com"
    
    func getAllProducts() async -> [Product] {
        let endPoint = "/products"
        let url = URL(string: url + endPoint)!
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            let decodedResponse = try JSONDecoder().decode(Products.self, from: data)
            return decodedResponse
        }
        catch {
            print("Error: \(error.localizedDescription)")
            return []
        }
    }
}
