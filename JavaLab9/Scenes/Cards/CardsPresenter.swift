//
//  CardsPresenter.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/14/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol CardsPresenter {
    func throwCardButtonDidPressed()
    func throwRandomCardButtonDidPressed()
}

class CardsPresenterImplementation: CardsPresenter {
    private weak var view: CardsView!
    
    init(view: CardsView) {
        self.view = view
    }
    
    func throwCardButtonDidPressed() {
        guard let view = view as? CardsViewController,
            let cardSuitFieldText = view.cardSuitField.text,
            let cardValueFieldText = view.cardValueField.text,
            let cardSuitCode = Int(cardSuitFieldText),
            let cardValueCode = Int(cardValueFieldText),
            (1...4).contains(cardSuitCode),
            (6...14).contains(cardValueCode) else {
                self.view.display(cardName: "cardUndefined")
                return
        }
        let card = Card(cardSuitCode: cardSuitCode, cardValueCode: cardValueCode)
        view.display(cardName: card.name)
    }
    
    func throwRandomCardButtonDidPressed() {
        let cardSuitCode = Int.random(in: 1...4)
        let cardValueCode = Int.random(in: 6...14)
        let card = Card(cardSuitCode: cardSuitCode, cardValueCode: cardValueCode)
        view.display(cardName: card.name)
    }
}
