//
//  CustomButton.swift
//  Deveem
//
//  Created by Sasha on 02.10.2024.
//

import SwiftUI

struct CustomButton: View {
    let buttonText: String
    let buttonImage: String
    let buttonColor: Color
    let textColor: Color
    let imageColor: Color?
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Text(buttonText)
                    .font(.system(size: 20).bold())
                    .foregroundColor(textColor)
                Spacer()
                Image(buttonImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    .foregroundColor(imageColor)
            }
            .padding(.vertical, 18)
            .padding(.horizontal, 32)
            .background(buttonColor)
            .cornerRadius(40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
    }
}
