//
//  MultiplicationTablePresenter.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/20/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol MultiplicationTablePresenter {
    func submitButtonDidPressed()
}

class MultiplicationTablePresenterImplementation: MultiplicationTablePresenter {
    private weak var view: MultiplicationTableView!
    private var model: MultiplicationTableModel
    
    private var isStarted = false
    
    init(view: MultiplicationTableView) {
        self.view = view
        self.model = MultiplicationTableModel()
    }
    
    func submitButtonDidPressed() {
        view.display(error: " ")
        if !isStarted {
            isStarted = true
            view.displayAll()
            model.start()
            let equation = model.generate()
            view.display(equation: equation)
            view.display(counter: "0/10")
            return
        }
        guard let view = view as? MultiplicationTableViewController,
            let answerText = view.resultField.text,
            let answer = Int(answerText) else { return }
        let isCorrect = model.check(answer: answer)
        if !isCorrect {
            view.display(error: "Wrong! Result is \(model.answer)")
        }
        view.display(counter: "\(10 - model.counter)/10")
        if model.counter != 0 {
            let equation = model.generate()
            view.display(equation: equation)
            return
        }
        isStarted = false
        view.display(mark: "\(model.correctCounter)/10")
        view.display(button: "Start")
    }
}
