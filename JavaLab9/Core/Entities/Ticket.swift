//
//  Ticket.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/18/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class Ticket {
    var number: Int
    var length: Int
    
    var isLucky: Bool {
        let halfLength = self.length / 2
        var currentNumber = self.number
        let lastHalfSum = countDigitsSum(border: halfLength, number: &currentNumber)
        // If number odd passing mid digit
        // i.e. 12345, passing number 3
        if self.length % 2 == 1 {
            currentNumber /= 10
        }
        
        let firstHalfSum = countDigitsSum(border: halfLength, number: &currentNumber)
        return firstHalfSum == lastHalfSum
    }
    
    init(number: Int, length: Int) {
        self.number = number
        self.length = length
    }
    
    private func countDigitsSum(border: Int, number: inout Int) -> Int {
        var sum = 0
        for _ in 0..<border {
            let digit = number % 10
            number /= 10
            sum += digit
        }
        return sum
    }
}
