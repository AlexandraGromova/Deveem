//
//  ProductsListCell.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI

struct ProductCell: View {
    
    var product: ProductRealm
    
    var body: some View {
        VStack {
            if product.image == ""  {
                Rectangle()
                    .fill(Color.gray)
                    .scaledToFit()
                    .padding(16)
                    .background(.white)
            } else {
                AsyncImage(url: URL(string: (product.image))) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .background(.white)
                        .padding(16)
                } placeholder: {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.7)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaledToFit()
                        .padding(16)
                }
                .background(.white)
            }
            HStack() {
                Text("\(product.title)")
                    .font(.system(size: 12))
                    .lineLimit(2)
                Text(String(format: "%.2f", product.price))
                    .font(.system(size: 16)) +
                Text("$")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 15.25)
            .padding(.bottom, 16)
        }
        .frame(width: 172.5)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
