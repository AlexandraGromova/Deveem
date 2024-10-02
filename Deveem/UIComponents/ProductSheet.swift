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
    var tapGoToCart: () -> ()
    @State var isFirstTap: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            if product.image == ""  {
                Rectangle()
                    .fill(Color.gray)
                    .scaledToFit()
                    .padding(16)
                    .background(.white)
                    .frame(maxHeight: .infinity)
            } else {
                AsyncImage(url: URL(string: (product.image))) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .background(.white)
                        .padding(16)
                        .frame(maxHeight: .infinity)
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
                        .frame(maxHeight: .infinity)
                }
                .background(.white)
            }
            Divider()
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(product.title)
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    HStack() {
                        Text("Category")
                            .font(.system(size: 16))
                            .foregroundStyle(.gray)
                        Text("\(product.category.rawValue)")
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                    }
                    HStack() {
                        Text("Rating")
                            .font(.system(size: 16))
                            .foregroundStyle(.gray)
                        ForEach(0..<5, id: \.self) { index in
                            Image(getStarType(for: index, rate: product.rating?.rate ?? 0.0))
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                        }
                    }
                    HStack(alignment: .bottom) {
                        Text("Price")
                            .font(.system(size: 16))
                            .foregroundStyle(.gray)
                        Text(String(format: "%.2f", product.price))
                            .font(.system(size: 28)) +
                        Text("$")
                            .font(.system(size: 18))
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.top, 16)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Description")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                        .padding(.bottom, 6)
                    Text(product.productDescription)
                        .font(.system(size: 12))
                        .foregroundStyle(.grayDark)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 12)
                Spacer()
                CustomButton(buttonText: isFirstTap ? "ADD TO CART" : "GO TO CART",
                             buttonImage: isFirstTap ? "cart_plus" : "cart_arrow",
                             buttonColor: isFirstTap ? .white : .black,
                             textColor: isFirstTap ? .black : .white,
                             imageColor: isFirstTap ? .black : .white) {
                    if isFirstTap {
                        tapAddToCart()
                    } else {
                        tapGoToCart()
                        selectedSheetProduct = nil
                    }
                    isFirstTap.toggle()
                }
                             .padding(.bottom, 0)
            }
            .padding(.horizontal, 16)
            .frame(maxHeight: .infinity)
        }
    }
    
    func getStarType(for index: Int, rate: Float) -> String {
        let starIndex = Float(index + 1)
        if rate >= starIndex {
            return "star_full"
        } else if rate >= starIndex - 0.5 {
            return "star_half"
        } else {
            return "star_empty"
        }
    }
}

