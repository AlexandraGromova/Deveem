//
//  ContentView.swift
//  Deveem
//
//  Created by Sasha on 26.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            NavigationStack {
                GeometryReader { proxy in
                    let topEdge = proxy.safeAreaInsets.top
                    ListProductsScreen(topEdge: topEdge)
                        .ignoresSafeArea(.all, edges: .top)
                }
            }
        }else {
            SplashScreen(isActive: $isActive)
        }
    }
}

#Preview {
    ContentView()
}
