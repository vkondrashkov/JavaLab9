//
//  CardValue.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/15/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

enum CardValue: String {
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "Jack"
    case queen = "Queen"
    case king = "King"
    case ace = "Ace"
    
    init?(code: Int) {
        switch code {
        case 6:
            self = .six
        case 7:
            self = .seven
        case 8:
            self = .eight
        case 9:
            self = .nine
        case 10:
            self = .ten
        case 11:
            self = .jack
        case 12:
            self = .queen
        case 13:
            self = .king
        case 14:
            self = .ace
        default:
            return nil
        }
    }
}
