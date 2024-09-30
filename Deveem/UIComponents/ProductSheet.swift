//
//  ProductSheet.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI

struct ProductSheet: View {
    
    var product: ProductRealm
    @Binding var selectedSheetProduct: ProductRealm?
    var tapAddToCart: () -> ()
    
    var body: some View {
        VStack() {
            if product.image == ""  {
                Image("plug_image")
                    .resizable()
                    .scaledToFit()
                    .padding(16)
                    .background(.white)
            } else {
                AsyncImage(url: URL(string: (product.image))) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .background(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 16)
                } placeholder: {
                    ProgressView()
                }
                .background(.white)
            }
            Divider()
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.system(size: 20))
                    .foregroundStyle(.black)
                Spacer()
                HStack() {
                    Text("Category")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                    Text("\(product.category.rawValue)")
                        .font(.system(size: 16))
                        .foregroundStyle(.black)
                }
                Spacer()
                HStack() {
                    Text("Rating")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                    Text("Men's clothing")
                        .font(.system(size: 16))
                        .foregroundStyle(.black)
                }
                Spacer()
                HStack() {
                    Text("Price")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                    Text(String(format: "%.2f", product.price))
                        .font(.system(size: 28)) +
                    Text("$")
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)
                }
                Spacer()
                Text("Description")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
                Spacer()
                Text(product.productDescription)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
            .padding(16)
            Button {
                tapAddToCart()
                selectedSheetProduct = nil
            } label: {
                HStack() {
                    Text("ADD TO CART")
                        .font(.system(size: 20).bold())
                        .foregroundStyle(.black)
                    Spacer()
                    Image("cart_plus")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                }
                .padding(18)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.horizontal, 16)
                
            }
        }
    }
}

