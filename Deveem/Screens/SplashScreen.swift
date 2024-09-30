//
//  SplashScreen.swift
//  Deveem
//
//  Created by Sasha on 28.09.2024.
//

import SwiftUI

struct SplashScreen: View {
    
    @StateObject var vm = AppContainer.resolve(SplashScreenVM.self)
    @State private var scale = 0.7
    @Binding var isActive: Bool
    
    var body: some View {
        VStack() {
            Spacer()
            VStack {
                HStack(spacing: 6) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 56)
                    Text("market")
                        .font(.system(size: 48))
                }
            }
            .scaleEffect(scale)
            .onAppear{
                withAnimation(.easeIn(duration: 0.7)) {
                    self.scale = 0.9
                }
            }
            Spacer()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity)
        .background(.grayLight)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
