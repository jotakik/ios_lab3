//
//  GameBoard.swift
//  Lab3
//
//  Created by Joshua Tan on 2025/11/11.
//

import SwiftUI

struct GameBoard: View {
    @Bindable var viewModel: MemoryGameStore
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, overlay: "flag.fill")
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.6)) {
                                viewModel.selectCard(card: card)
                            }
                        }
                }
            }
        }
    }
}

//#Preview {
//    GameBoard()
//}
