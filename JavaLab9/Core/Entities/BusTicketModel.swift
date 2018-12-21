//
//  BusTicketModel.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/20/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class BusTicketModel {
    var length: Int = 0
    
    func countBusTickets(completion: @escaping (Int) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let startBorder = Int(pow(Double(10), Double(self.length - 1)))
            let endBorder = startBorder * 10
            var count = 0
            for number in 0..<endBorder {
                let ticket = Ticket(number: number, length: self.length)
                
                if ticket.isLucky { count += 1 }
            }
            DispatchQueue.main.async {
                completion(count)
            }
        }
    }
}
