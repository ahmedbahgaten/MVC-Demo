//
//  Concenration.swift
//  Concentration
//
//  Created by AHMED on 3/10/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard : Int?
    func chooseCard(at index :Int) {
        print(cards[index].identifier)
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else {
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFacedUp = false
                    }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = index
                }
            }
        }
    init(numberOfPairsOfCards:Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card , card]
        }
    }
}

