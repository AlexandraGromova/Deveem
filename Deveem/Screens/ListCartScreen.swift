//
//  ListCartScreen.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI

struct ListCartScreen: View {
    
    @StateObject var vm = AppContainer.resolve(ListCartVM.self)
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack() {
            TopBarCart() {
                dismiss()
            }
            .frame(height: 120)
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(Array(vm.products.enumerated()), id: \.element) { index, item in
                        CartCell(product: item) {
                            vm.removeProduct(product: item)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                }
            }
            .padding(.bottom, 32)
        }
        .scrollIndicators(.never)
        .mask(
            VStack(spacing: 0) {
                Color.black.frame(maxHeight: .infinity)
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .grayLight, location: 0.00),
                        Gradient.Stop(color: .grayLight.opacity(0), location: 1.00)
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
                .frame(height: 84)
            }
        )
        .overlay() {
            VStack() {
                Spacer()
                CustomButton(buttonText: vm.products.isEmpty ? "Add something" : "BUY" ,
                             buttonImage: vm.products.isEmpty ? "bag_empty" : "bag_full",
                             buttonColor: vm.products.isEmpty ? .clear : .black,
                             textColor: vm.products.isEmpty ? .black : .white,
                             imageColor: vm.products.isEmpty ? .black : .white) {
                    if vm.products.isEmpty {
                        dismiss()
                    } else {
                        showAlert = true
                    }
                }
                             .padding(.horizontal, 16)
                             .padding(.bottom, 40)
            }
            .alert("Make a purchase", isPresented: $showAlert) {
                Button("OK") {
                    vm.removeProducts()
                }
                Button("No", role: .cancel) {}
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        .background(.grayLight)
    }
}

