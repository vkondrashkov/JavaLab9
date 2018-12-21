//
//  CalculatorPresenter.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/17/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol CalculatorPresenter {
    func numberButtonDidPressed(tag: Int)
    func signButtonDidPressed(tag: Int)
}

class CalculatorPresenterImplementation: CalculatorPresenter {
    private weak var view: CalculatorView!
    private var model: Calculator
    
    init(view: CalculatorView) {
        self.view = view
        self.model = Calculator()
    }
    
    func numberButtonDidPressed(tag: Int) {
        guard let view = view as? CalculatorViewController else { return }
        
        if let number = model.currentNumber {
            if model.length(number: number) >= 9 { return }
        }
        
        model.update(tag: tag)
        if let number = model.currentNumber {
            if !model.hasFloatingPoint { view.display(result: String(Int(number))) }
            else { view.display(result: String(number)) }
        }
    }
    
    func signButtonDidPressed(tag: Int) {
        guard let view = view as? CalculatorViewController else { return }
        if tag == 11 {
            model.clear()
            view.display(result: " ")
            return
        }
        if tag == 17 {
            if model.operation == .division
                && model.currentNumber == 0 {
                view.display(result: "Error")
                return
            }
            
            model.solve() {
                if let number = self.model.currentNumber {
                    let length = self.model.length(number: number)
                    if length > 10 {
                        self.view.display(result: "Value too big")
                        return
                    }
                    self.view.display(result: String(number))
                }
            }
            return
        }
        if view.resultLabel.text != "" {
            guard let currentNumber = model.currentNumber else { return }
            model.previousNumber = currentNumber
            model.currentNumber = nil
            model.hasFloatingPoint = false
            model.hasDecimalPlaces = false
            switch (tag) {
            case 13:
                // Division
                view.display(result: "/")
                model.operation = .division
            case 14:
                // Multiplication
                view.display(result: "x")
                model.operation = .multiplication
            case 15:
                // Subtraction
                view.display(result: "-")
                model.operation = .subtraction
            case 16:
                // Addition
                view.display(result: "+")
                model.operation = .addition
            default:
                return
            }
        }
    }
}
