//
//  CellElements.swift
//  Lab3
//
//  Created by Joshua Tan on 2025/11/11.
//

import SwiftUI

//  Formats the element that will be seen when the cell is face-up
struct FaceUpElement: View {
    let cellElement: String
    let elementSize: CGFloat
    
    var body: some View {
        Text(cellElement)
            .font(.system(size: elementSize))
    }
}


//  Formats the generic overlay that will be seen when the cell is face-down
struct FaceDownElement: View {
    let overlay: String
    let overlayColor: Color
    
    let elementSize: CGFloat
    var overlaySize: CGFloat { elementSize * 0.85 }
    
    var body: some View {
        Image(systemName: overlay)
            .font(.system(size: overlaySize))
            .foregroundStyle(overlayColor)
    }
}
