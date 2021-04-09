//
//  Concentration.swift
//  CS193
//
//  Created by Роман Прохоров on 06.04.2021.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Error")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Error")
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
