//
//  Card.swift
//  CS193
//
//  Created by Роман Прохоров on 06.04.2021.
//

import Foundation

struct Card {
    
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUnicidentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUnicidentifier()
    }
}
