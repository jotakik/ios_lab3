//
//  MemoryGame.swift
//  Lab3
//
//  Created by Joshua Tan on 2025/11/8.
//

import Foundation

struct MemoryGame {
    private(set) var cards: [Card]
    private var unmatchedOpenedCard1Idx: Int = -1
    private var unmatchedOpenedCard2Idx: Int = -1
    private var idToIdx: [UUID: Int]
    
    struct Card: Identifiable {
        let id: UUID = UUID()
        let content: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
    init (contents: [String]) {
        cards = []
        for c in contents {
            cards.append(Card(content: c))
            cards.append(Card(content: c))
        }
        cards.shuffle()
        
        idToIdx = [:]
        for (idx, card) in cards.enumerated() {
            idToIdx[card.id] = idx
        }
    }
    
    private func getIdx(_ card: Card) -> Int {
        return idToIdx[card.id] ?? -1
    }
    
    mutating func selectCard(card: Card) -> Bool {
        let newCardIdx = getIdx(card)
        if newCardIdx == -1 {
            return false
        }

        if cards[newCardIdx].isMatched {
            return false
        }
        
        //  Flip the 2 opened but not matching cards back to face down if they exist
        if unmatchedOpenedCard1Idx != -1 && unmatchedOpenedCard2Idx != -1 {
            cards[unmatchedOpenedCard1Idx].isFaceUp = false
            cards[unmatchedOpenedCard2Idx].isFaceUp = false
            unmatchedOpenedCard1Idx = -1
            unmatchedOpenedCard2Idx = -1
        }

        cards[newCardIdx].isFaceUp = true

        if unmatchedOpenedCard1Idx == -1 {  //  If this is the only unmatched face up card
            unmatchedOpenedCard1Idx = newCardIdx
        }
        else {  //  If this is the second face up card, check if it is a match
            if cards[unmatchedOpenedCard1Idx].content == cards[newCardIdx].content {    // cards match
                cards[unmatchedOpenedCard1Idx].isMatched = true
                cards[newCardIdx].isMatched = true
                unmatchedOpenedCard1Idx = -1
            }
            else {  // cards do not match
                unmatchedOpenedCard2Idx = newCardIdx
            }
        }
        return true
    }
    
//    /**
//     If selected card is already matched, do nothing. (Returns false)
//     If selected card is face down, flip it up. (Returns true)
//     */
//    mutating func selectCard(card: Card) -> Bool {
//        let cIdx = getIdx(card)
//        if cIdx == -1 {
//            return false
//        }
//
//        var c = cards[cIdx]
//        if c.isMatched {
//            return false
//        }
//        
//        c.isFaceUp = true
//        cards[cIdx] = c     //  Write updated card back to cards array
//        
//        if unmatchedOpenedCard1Idx == -1 {
//            unmatchedOpenedCard1Idx = cIdx
//        }
//        else {
//            unmatchedOpenedCard2Idx = cIdx
//        }
//        
//        return true
//    }
//    
//    
//    /**
//     Must be called after func selectCard is called.
//     
//     If 0 or 1 cards are face up, do nothing. (Returns false)
//     If 2 cards are already face up, check if the cards match.
//        If they do not match, turn both cards face down. (Returns false)
//        If they match, keep both cards face up permanently. (Returns true)
//     */
//    mutating func checkMatch() -> Bool {
//        //  Less than 2 cards are face up
//        if unmatchedOpenedCard1Idx == -1 || unmatchedOpenedCard2Idx == -1 {
//            return false
//        }
//        
//        //  2 cards are face up
//        var card1 = cards[unmatchedOpenedCard1Idx]
//        var card2 = cards[unmatchedOpenedCard2Idx]
//        
//        if card1.content == card2.content {
//            card1.isMatched = true
//            card2.isMatched = true
//        }
//        else {
//            card1.isFaceUp = false
//            card2.isFaceUp = false
//        }
//        
//        //  Write updated cards back to cards array
//        cards[unmatchedOpenedCard1Idx] = card1
//        cards[unmatchedOpenedCard2Idx] = card2
//        
//        unmatchedOpenedCard1Idx = -1
//        unmatchedOpenedCard2Idx = -1
//        
//        return true
//    }
}
