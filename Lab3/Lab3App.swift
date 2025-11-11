//
//  Lab3App.swift
//  Lab3
//
//  Created by Joshua Tan on 2025/11/8.
//

import SwiftUI

@main
struct Lab3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MemoryGameStore())
        }
    }
}
