//
//  Card.swift
//  Concentration
//
//  Created by AHMED on 3/10/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier :Int
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
