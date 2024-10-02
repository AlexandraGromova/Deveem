//
//  CartCell.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI



struct CartCell: View {
    
    var product: ProductRealm
    var remove: () -> ()
    
    var body: some View {
        HStack() {
            if product.image == ""  {
                Rectangle()
                    .fill(Color.gray)
                    .scaledToFit()
                    .padding(16)
                    .background(.white)
                    .frame(maxWidth: .infinity)
            } else {
                AsyncImage(url: URL(string: (product.image))) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .background(.white)
                        .padding(16)
                        .frame(maxWidth: .infinity)
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
                        .frame(maxWidth: .infinity)
                }
                .background(.white)
            }
            Divider()
            VStack() {
                Text("\(product.title)")
                    .font(.system(size: 16))
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack() {
                    Text(String(format: "%.0f", product.price))
                        .font(.system(size: 28)) +
                    Text("$")
                        .font(.system(size: 20))
                        .foregroundStyle(.gray)
                    Spacer()
                    Button{
                        remove()
                    } label: {
                        Image("cart_minus")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.white)
    }
}
