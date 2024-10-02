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
            CustomButton(buttonText: "ADD TO CART", buttonImage: "cart_plus", buttonColor: .white, textColor: .black, imageColor: .black) {
                tapAddToCart()
                selectedSheetProduct = nil
            }
        }
    }
}

