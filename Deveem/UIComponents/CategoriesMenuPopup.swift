//
//  CategoriesMenuPopup.swift
//  Deveem
//
//  Created by Sasha on 30.09.2024.
//

import SwiftUI

struct CategoriesMenuPopup: View {
    
    @Binding var category : CategoryRealm
    @State private var selectedCategory: CategoryRealm = .all
    
    var body: some View {
        Menu {
            Button{ }
        label: {
            Text("Categories")
                .font(.system(size: 24))
            Text("Indicate your preferences")
                .font(.system(size: 16))
        }
            Divider()
            ForEach(CategoryRealm.allCases, id: \.self) { category in
                Button {
                    self.category = category
                    selectedCategory = category
                } label: {
                    Label(category.rawValue.capitalized, image: selectedCategory == category ? "check" : "")
                }
            }
        } label: {
            Image("categories")
                .resizable()
                .scaledToFit()
                .frame(height: 24)
        }
    }
}
