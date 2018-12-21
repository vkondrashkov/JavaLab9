//
//  BusTicketPresenter.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/20/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol BusTicketPresenter {
    func submitButtonDidPressed()
}

class BusTicketPresenterImplementation: BusTicketPresenter {
    private weak var view: BusTicketView!
    private var model: BusTicketModel
    
    init(view: BusTicketView) {
        self.view = view
        self.model = BusTicketModel()
    }
    
    func submitButtonDidPressed() {
        view.display(result: " ")
        guard let view = view as? BusTicketViewController,
            let text = view.ticketLengthTextField.text,
            let length = Int(text) else {
            self.view.display(result: "Error!")
            return
        }
        view.showActivityIndicator()
        model.length = length
        model.countBusTickets() { count in
            view.display(result: "Total bus tickets: \(count)")
            view.hideActivityIndicator()
        }
    }
}
