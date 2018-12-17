//
//  HeadsOrTailsPresenter.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/16/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol HeadsOrTailsPresenter {
    func coinImageDidTapped()
}

class HeadsOrTailsPresenterImplementation: HeadsOrTailsPresenter {
    private weak var view: HeadsOrTailsView!
    private var coin: Coin
    
    init(view: HeadsOrTailsView) {
        self.view = view
        coin = Coin()
    }
    
    func coinImageDidTapped() {
        var headsCounter = 0
        var tailsCounter = 0
        for _ in 0..<1000 {
            coin.toss()
            if coin.isHeads {
                headsCounter += 1
            }
            else {
                tailsCounter += 1
            }
        }
        view.display(result: "Heads: \(headsCounter) Tails: \(tailsCounter)")
        view.display(coinName: coin.description)
    }
}
