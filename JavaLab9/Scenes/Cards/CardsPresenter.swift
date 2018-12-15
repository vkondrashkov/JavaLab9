//
//  CardsPresenter.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/14/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol CardsPresenter {
    
}

class CardsPresenterImplementation: CardsPresenter {
    private weak var view: CardsView!
    
    init(view: CardsView) {
        self.view = view
    }
}
