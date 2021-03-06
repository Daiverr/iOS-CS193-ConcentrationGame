//
//  Concentration.swift
//  CS193
//
//  Created by Роман Прохоров on 06.04.2021.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
//          indices - range
//          filter - take "closure" for and left only with isFaceUp true
//          oneAndOnly - extension, return first element of array or nil if element not found or more then one
        }
        set(newValue) {
                
//            for index in cards.indices {
//               cards[index].isFaceUp = (index == newValue)
//            }
        }
    }
    
    mutating func chooseCard(at index: Int)  {
        assert(cards.indices.contains(index), "Error")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
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

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
