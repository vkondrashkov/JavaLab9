//
//  CalculatorPresenter.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/17/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol CalculatorPresenter {
    
}

class CalculatorPresenterImplementation: CalculatorPresenter {
    private weak var view: CalculatorView!
    
    init(view: CalculatorView) {
        self.view = view
    }
}
