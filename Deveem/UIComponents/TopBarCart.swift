//
//  TopBarCart.swift
//  Deveem
//
//  Created by Sasha on 02.10.2024.
//

import SwiftUI

struct TopBarCart: View {
    var dismiss: () -> ()
    var body: some View {
        VStack() {
            Spacer()
            HStack() {
                Button(action: {
                    dismiss()
                }) {
                    HStack(spacing: 0) {
                        Image("chevron_left")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                        Text("Back")
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 4)
                    }
                } .padding(.horizontal, 16)
                Spacer()
                Text("Cart")
                    .font(.system(size: 20).bold())
                    .foregroundStyle(.black)
                    .padding(.horizontal, 4)
                Spacer()
                HStack(spacing: 0) {
                    Image("chevron_left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 48)
                    Text("Back")
                        .font(.system(size: 16))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 4)
                } .padding(.horizontal, 16)
                    .hidden()
            }
        }
    }
}

