//
//  ViewController.swift
//  CS193
//
//  Created by Роман Прохоров on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0 {
        didSet {
            flipsCountLabel.text = "Flips: \(flipCount)"
        }
    }
    let boy = (5, "a")
    
    @IBOutlet weak var flipsCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🦁","🐷","🐱","🐶", "🐭", "🐵", "🐸", "🐰"]
    var pictureChoices: [UIImage] = [UIImage(named: "Roman")!, UIImage(named: "Zaval")!,UIImage(named: "Nata")!,UIImage(named: "Ilia")!,UIImage(named: "Bar")!,UIImage(named: "Artur")!,UIImage(named: "Andrey")!]
    
    var emoji = [Int:UIImage]()
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Choose another card")
        }
    }
    
    func updateViewFromModel() {
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
    
    func emoji(for card: Card) -> UIImage {
        if emoji[card.identifier] == nil, pictureChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(pictureChoices.count)))
            emoji[card.identifier] = pictureChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? UIImage(named: "Roman")!// as! UIImage
    }
    
}
