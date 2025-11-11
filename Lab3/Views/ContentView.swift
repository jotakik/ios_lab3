//
//  ContentView.swift
//  Lab3
//
//  Created by Joshua Tan on 2025/11/8.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: MemoryGameStore
    
    var body: some View {
        VStack {
            Text("Test Your Memory!")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            GameBoard(viewModel: viewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: MemoryGameStore())
}
