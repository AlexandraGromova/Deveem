//
//  TopBar.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI

struct TopBar: View {
    
    @Binding var offset: CGFloat
    var topEdge: CGFloat
    var maxHeight: CGFloat
    var category: CategoryRealm
    
    var body: some View {
        ZStack() {
            VStack(alignment: .leading) {
                Text("Products")
                    .font(.system(size: 32).bold())
                    .foregroundStyle(.black)
                Text(category.rawValue.uppercased())
                    .font(.system(size: 14))
                    .foregroundStyle(.black)
            }
            .padding(.leading, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(getOpacity())
        }
        RoundedRectangle(cornerRadius: 0)
            .foregroundStyle(.ultraThinMaterial)
            .opacity(topBarTitleOpacity())
    }
    
    func getOpacity() -> CGFloat {
        let progress = -offset / 70
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1
    }
    
    func topBarTitleOpacity() -> CGFloat {
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}
