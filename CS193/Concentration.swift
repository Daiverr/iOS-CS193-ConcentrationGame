//
//  Concentration.swift
//  CS193
//
//  Created by Роман Прохоров on 06.04.2021.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
     
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
