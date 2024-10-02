//
//  ListProductsScreen.swift
//  Deveem
//
//  Created by Sasha on 27.09.2024.
//

import SwiftUI

struct ListProductsScreen: View {
    
    @StateObject var vm = AppContainer.resolve(ListProductsVM.self)
    let maxHeight: CGFloat = 180
    var topEdge: CGFloat
    @State var offset: CGFloat = 0
    @State private var selectedSheetProduct: ProductRealm?
    @State private var navigateToCart: Bool = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                GeometryReader { proxy in
                    TopBar(offset: $offset, topEdge: topEdge, maxHeight: maxHeight, category: vm.selectedCategory)
                        .frame(maxWidth: .infinity)
                        .frame(height: getHeaderHeight(), alignment: .bottom)
                        .overlay (
                            HStack(alignment: .bottom) {
                                CategoriesMenuPopup(category: $vm.selectedCategory)
                                Spacer()
                                ZStack() {
                                    HStack(alignment: .center, spacing: 4) {
                                        Image("logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 32)
                                        Text("market")
                                            .font(.system(size: 28))
                                            .foregroundStyle(.black)
                                    }
                                    .opacity(getOpacity())
                                    VStack() {
                                        Text("Products")
                                            .font(.system(size: 20).bold())
                                            .foregroundStyle(.black)
                                        Text(vm.selectedCategory.rawValue.uppercased())
                                            .font(.system(size: 14))
                                            .foregroundStyle(.black)
                                    }
                                    .opacity(topBarTitleOpacity())
                                }
                                Spacer()
                                NavigationLink(destination: ListCartScreen()) {
                                    Image("cart_full")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 24)
                                }
                            }
                                .padding(.horizontal)
                                .frame(height: 60)
                                .padding(.top, 55)
                            , alignment: .top
                        )
                }
                .frame(height: maxHeight)
                .offset(y: -offset)
                .zIndex(1)
                
                VStack(spacing: 0) {
                    ScrollView {
                        LazyHStack(alignment: .top, spacing: 8) {
                            // duplicate code, put in a separate view
                            LazyVStack(spacing: 0) {
                                ForEach(Array(vm.categoryProducts.enumerated()), id: \.element) { index, item in
                                    if index % 2 != 0 {
                                        ProductCell(product: item)
                                            .padding(.vertical, 8)
                                            .onTapGesture {
                                                selectedSheetProduct = item
                                            }
                                            .sheet(item: $selectedSheetProduct) { product in
                                                ProductSheet(product: product, selectedSheetProduct: $selectedSheetProduct) {
                                                    vm.addToCart(product: product)
                                                } tapGoToCart: {
                                                    navigateToCart = true
                                                }
                                                .presentationDragIndicator(.visible)
                                                .presentationDetents([.fraction(0.93)])
                                                .presentationCornerRadius(50)
                                            }
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.size.width / 2 - 16)
                            // duplicate code, put in a separate view
                            LazyVStack(spacing: 0) {
                                ForEach(Array(vm.categoryProducts.enumerated()), id: \.element) { index, item in
                                    if index % 2 == 0 {
                                        ProductCell(product: item)
                                            .padding(.vertical, 8)
                                            .onTapGesture {
                                                selectedSheetProduct = item
                                            }
                                            .sheet(item: $selectedSheetProduct) { product in
                                                ProductSheet(product: product, selectedSheetProduct: $selectedSheetProduct) {
                                                    vm.addToCart(product: product)
                                                } tapGoToCart: {
                                                    navigateToCart = true
                                                }
                                                .presentationDragIndicator(.visible)
                                                .presentationDetents([.fraction(0.93)])
                                                .presentationCornerRadius(50)
                                            }
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.size.width / 2 - 16)
                        }
                    }
                    .scrollIndicators(.never)
                }
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
            .navigationDestination(isPresented: $navigateToCart) {
                ListCartScreen()
            }
        }
        .background(.grayLight)
        .coordinateSpace(name: "SCROLL")
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
    }
    func getHeaderHeight() -> CGFloat {
        let topHeight = maxHeight + offset
        return topHeight > (60 + topEdge) ? topHeight : (60 + topEdge)
    }
    
    func topBarTitleOpacity() -> CGFloat {
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
    
    func getOpacity() -> CGFloat {
        let progress = -offset / 70
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1
    }
}

struct OffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return Color.clear
                }, alignment: .top
            )
    }
}
