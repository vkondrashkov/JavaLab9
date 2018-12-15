//
//  Card.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/15/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class Card {
    private let cardSuit: CardSuit?
    private let cardValue: CardValue?
    
    var name: String {
        guard let cardSuitName = cardSuit?.rawValue,
            let cardValueName = cardValue?.rawValue else {
                return "cardBack"
        }
        return cardSuitName + cardValueName
    }
    
    init(cardSuitCode: Int, cardValueCode: Int) {
        cardSuit = CardSuit(code: cardSuitCode)
        cardValue = CardValue(code: cardValueCode)
    }
}
