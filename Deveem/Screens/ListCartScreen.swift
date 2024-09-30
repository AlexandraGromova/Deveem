//
//  ListCartScreen.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI

struct ListCartScreen: View {
    
    @StateObject var vm = AppContainer.resolve(ListCartVM.self)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16) {
                ForEach(Array(vm.products.enumerated()), id: \.element) { index, item in
                    CartCell(product: item)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
            }
        }
        .background(.grayLight)
        .scrollIndicators(.never)
    }
}
