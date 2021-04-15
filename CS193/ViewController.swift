//
//  ViewController.swift
//  CS193
//
//  Created by Роман Прохоров on 31.03.2021.
//

import UIKit

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount: Int = 0 {
        didSet {
            //flipsCountLabel.text = "Flips: \(flipCount)"
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        flipsCountLabel.attributedText = NSAttributedString(string: "Flips: \(flipCount)", attributes: [
            .strokeColor : UIColor.yellow,
            .strokeWidth: 5.0,
            .foregroundColor: UIColor.yellow
        ])
    }
    
    @IBOutlet private weak var flipsCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
        
    //private var pictureChoices: [UIImage] = [UIImage(named: "Roman")!, UIImage(named: "Zaval")!,UIImage(named: "Nata")!,UIImage(named: "Ilia")!,UIImage(named: "Bar")!,UIImage(named: "Artur")!,UIImage(named: "Andrey")!]
    private var pictureChoices: [String] = ["Roman","Zaval","Nata","Ilia","Bar","Artur","Andrey"]
    
    private var picture = [Card:UIImage]()
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Choose another card")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                //button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.setImage(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                //button.setImage(nil, for: UIControl.State.normal)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                //button.setImage(UIImage(named: "Image"), for: UIControl.State.normal)
                card.isMatched ? button.setImage(nil, for: UIControl.State.normal) : button.setImage(UIImage(named: "Image"), for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.4626568195, blue: 0.2875248011, alpha: 0) : #colorLiteral(red: 0.9996142983, green: 0.9494145513, blue: 0.01051531732, alpha: 1)
            }
        }
    }
    
    private func emoji(for card: Card) -> UIImage {
        if picture[card] == nil, pictureChoices.count > 0 {
            let randomStringIndex = pictureChoices.count.arc4random
            picture[card] = UIImage(named: pictureChoices.remove(at: randomStringIndex))
        }
        return picture[card] ?? UIImage(named: "Roman")!// as! UIImage
    }
    
}
