//
//  Coin.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/16/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class Coin {
    var isHeads = true
    
    var description: String {
        switch isHeads {
        case true:
            return "heads"
        default:
            return "tails"
        }
    }
    
    func toss() {
        let result = Int.random(in: 0...1)
        isHeads = result == 1
    }
}
