//
//  CellContent.swift
//  Lab3
//
//  Created by Joshua Tan on 2025/11/11.
//

import SwiftUI

//  The content of a single card (face-up element, face-down overlay, card border)
struct CardView: View {
    let card: MemoryGame.Card
    let overlay: String     //  The name of the SF symbol used as the overlay element
    
    let elementSize: CGFloat = 70   // The size of the face-up element
    let overlayColor = Color(white: 0.4)    // The color of the overlay element and cell border
        
    //  Creates the frame that aligns the face-up element and the overlay
    struct CellBox: ViewModifier {
        let elementSize: CGFloat
        var boxWidth: CGFloat { elementSize * 1.5 }
        var boxHeight: CGFloat { elementSize * 1.2 }
        
        func body(content: Content) -> some View {
            content
                .frame(width: boxWidth, height: boxHeight, alignment: .center)
        }
    }
    
    var body: some View {
        ZStack {
            FaceUpElement(cellElement: card.content, elementSize: elementSize)
                .modifier(CellBox(elementSize: elementSize))
                .opacity(card.isFaceUp ? 1 : 0)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            
            FaceDownElement(overlay: overlay, overlayColor: overlayColor, elementSize: elementSize)
                .modifier(CellBox(elementSize: elementSize))
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(overlayColor, lineWidth: 5)
        }
        .rotation3DEffect(
            .degrees(card.isFaceUp ? 180 : 0),
            axis: (x: 0, y: 1, z: 0),
            perspective: 0.5
        )
        .padding()
    }
}
