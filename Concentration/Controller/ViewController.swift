//
//  ViewController.swift
//  Concentration
//
//  Created by AHMED on 3/10/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   private var emoji = [Int:String]()
   private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards :Int {
        return cardButtons.count / 2
    }
    private(set) var flipCount  = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    private var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Chosen card was not in cardButtons")
        }
    }
   private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for:card), for: .normal)
                button.backgroundColor = .white
            }else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.4117647059, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.4117647059, blue: 0, alpha: 1)
                button.isEnabled = card.isMatched ? false : true
                
            }
        }
    }
    private func emoji(for card :Card) ->String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
      return emoji[card.identifier] ?? "?"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension Int {
    var arc4random : Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

