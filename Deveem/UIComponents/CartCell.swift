//
//  CartCell.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI



struct CartCell: View {
    
    var product: ProductRealm
    
    var body: some View {
        HStack() {
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
            Divider()
            VStack() {
                Text("\(product.title)")
                    .font(.system(size: 12))
                    .lineLimit(2)
                HStack() {
                    Text(String(format: "%.2f", product.price))
                        .font(.system(size: 16)) +
                    Text("$")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                    Button{
                        print("remove from userdefault")
                    } label: {
                        Image("cart_minus")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                    
                }
            }
        }
        .background(.white)
    }
}
