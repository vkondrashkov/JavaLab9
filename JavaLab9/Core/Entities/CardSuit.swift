//
//  CardSuit.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/15/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

enum CardSuit: String {
    case spike
    case cross
    case spade
    case heart
    
    init?(code: Int) {
        switch code {
        case 1:
            self = .spike
        case 2:
            self = .cross
        case 3:
            self = .spade
        case 4:
            self = .heart
        default:
            return nil
        }
    }
}
