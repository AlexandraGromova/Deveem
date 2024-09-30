//
//  DeveemApp.swift
//  Deveem
//
//  Created by Sasha on 26.09.2024.
//

import SwiftUI

@main
struct DeveemApp: App {
    
    init() {
        AppContainer.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
