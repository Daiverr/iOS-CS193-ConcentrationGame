//
//  Concentration.swift
//  CS193
//
//  Created by Роман Прохоров on 06.04.2021.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            //let matchingCard = card
            cards += [card, card] //because "Card" is sctuct and copy by value
        }
        //TODO: Shuffle the cards
        for i in 0..<cards.count {
            let tempCard = cards[i]
            let randomNumb = Int.random(in: 0..<cards.count)
            cards[i] = cards[randomNumb]
            cards[randomNumb] = tempCard
        }
    }
}
