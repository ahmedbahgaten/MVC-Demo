//
//  Concenration.swift
//  Concentration
//
//  Created by AHMED on 3/10/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
class Concentration {
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    func chooseCard(at index :Int) {
        assert(cards.indices.contains(index),"Chosen index is not in cards")
        print(cards[index].identifier)
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            }else {
                indexOfOneAndOnlyFaceUpCard = index
                }
            }
        }
    init(numberOfPairsOfCards:Int) {
        assert(numberOfPairsOfCards > 0 ,"You must at least have one pair of cards")

        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card , card]
        }
    }
}

