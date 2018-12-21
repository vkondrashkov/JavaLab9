//
//  MultiplicationTableModel.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/21/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class MultiplicationTableModel {
    var answer: Int = 0
    var counter = 10
    var correctCounter: Int = 0
    
    func start() {
        answer = 0
        counter = 10
        correctCounter = 0
    }
    
    func generate() -> String {
        counter -= 1
        let firstOperand = Int.random(in: 1...10)
        let secondOperand = Int.random(in: 1...10)
        answer = firstOperand * secondOperand
        return "\(firstOperand) * \(secondOperand) = ?"
    }
    
    func check(answer: Int) -> Bool {
        if answer == self.answer {
            correctCounter += 1
            return true
        }
        return false
    }
}
