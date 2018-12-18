//
//  Calculator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/18/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class Calculator {
    var didOperation = false
    var previousNumber: Double?
    var currentNumber: Double?
    var hasFloatingPoint = false
    var hasDecimalPlaces = false
    var operation: CalculatorOperation = .none
    
    func length(number: Double) -> Int{
        let textedNumber = String(number)
        return textedNumber.count
    }
    
    func update(tag: Int) {
        if didOperation {
            currentNumber = nil
            didOperation = false
        }
        if let unwrappedNumber = currentNumber {
            if tag == 10 {
                hasFloatingPoint = true
                return
            }
            if hasFloatingPoint {
                if hasDecimalPlaces {
                    let textedNumber = String(unwrappedNumber) + String(tag)
                    let newNumber = Double(textedNumber)
                    currentNumber = newNumber
                } else {
                    let number = Int(unwrappedNumber)
                    let newNumber = String(number) + "." + String(tag)
                    currentNumber = Double(newNumber)
                    hasDecimalPlaces = true
                }
            } else {
                let newNumber = Int(currentNumber!) * 10 + tag
                currentNumber = Double(newNumber)
            }
            return
        }
        
        // If program appeared here it means
        // We have no number, and tag 10 is "Point"
        // So we return this case, our number can't
        // start with point
        if tag == 10 { return }
        currentNumber = Double(tag)
    }
    
    func clear() {
        currentNumber = nil
        previousNumber = nil
        hasDecimalPlaces = false
        hasFloatingPoint = false
        operation = .none
    }
    
    func solve(completion: @escaping () -> Void) {
        if let previousNumber = self.previousNumber,
            let currentNumber = self.currentNumber {
            switch operation {
            case .modulus:
                let result = previousNumber / currentNumber
            case .division:
                let result = previousNumber / currentNumber
                self.previousNumber = nil
                self.currentNumber = result
            case .multiplication:
                let result = previousNumber * currentNumber
                self.previousNumber = nil
                self.currentNumber = result
            case .subtraction:
                let result = previousNumber - currentNumber
                self.previousNumber = nil
                self.currentNumber = result
            case .addition:
                let result = previousNumber + currentNumber
                self.previousNumber = nil
                self.currentNumber = result
            case .none:
                return
            default:
                return
            }
            didOperation = true
            operation = .none
            completion()
        }
    }
}
