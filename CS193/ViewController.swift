//
//  ViewController.swift
//  CS193
//
//  Created by Роман Прохоров on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {

    var flipCount: Int = 0 {
        didSet {
            flipsCountLabel.text = "Flips: \(flipCount)"
        }
    }
    let boy = (5, "a")
    
    @IBOutlet weak var flipsCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🐱","🐶","🐱","🐶"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("Cat")
        let cardNumber = cardButtons.firstIndex(of: sender)!
        print("CardNumber = \(cardNumber)")
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        flipCount += 1
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

