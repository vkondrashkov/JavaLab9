//
//  MultiplicationTableViewController.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/20/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol MultiplicationTableView: class {
    func displayAll()
    func display(mark: String)
    func display(error: String)
    func display(counter: String)
    func display(equation: String)
    func display(button: String)
}

class MultiplicationTableViewController: UIViewController, MultiplicationTableView {
    var presenter: MultiplicationTablePresenter!
    
    private var multiplicationTableView = UIView(frame: .zero)
    private var containerView = UIView(frame: .zero)
    
    private var equationCounterLabel = UILabel(frame: .zero)
    private var equationLabel = UILabel(frame: .zero)
    private var resultLabel = UILabel(frame: .zero)
    var resultField = UITextField(frame: .zero)
    private var errorLabel = UILabel(frame: .zero)
    private var submitButton = UIButton(frame: .zero)
    private var markLabel = UILabel(frame: .zero)
    
    override func loadView() {
        multiplicationTableView.backgroundColor = UIColor(red: 38.0 / 255.0, green: 81.0 / 255.0, blue: 127.0 / 255.0, alpha: 1)
        
        equationCounterLabel.text = " "
        equationCounterLabel.font = .boldSystemFont(ofSize: 17)
        equationCounterLabel.textAlignment = .center
        equationCounterLabel.textColor = .white
        containerView.addSubview(equationCounterLabel)
        activateFirstViewConstraints(view: equationCounterLabel)
        
        equationLabel.text = " "
        equationLabel.font = .boldSystemFont(ofSize: 17)
        equationLabel.textAlignment = .center
        equationLabel.textColor = .white
        containerView.addSubview(equationLabel)
        activateMidViewConstraints(view: equationLabel, anchorView: equationCounterLabel)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 17)
        resultLabel.textColor = .white
        containerView.addSubview(resultLabel)
        activateMidViewConstraints(view: resultLabel, anchorView: equationLabel)
        
        resultField.placeholder = "Answer"
        resultField.isHidden = true
        resultField.font = .boldSystemFont(ofSize: 17)
        resultField.borderStyle = .roundedRect
        resultField.autocorrectionType = .no
        resultField.keyboardType = .numberPad
        resultField.contentVerticalAlignment = .center
        containerView.addSubview(resultField)
        activateFieldConstraints(view: resultField, anchorView: resultLabel)
        
        errorLabel.text = " "
        errorLabel.font = .boldSystemFont(ofSize: 17)
        errorLabel.textColor = .red
        containerView.addSubview(errorLabel)
        activateMidViewConstraints(view: errorLabel, anchorView: resultField)
        
        submitButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        submitButton.setTitle("Start", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateMidViewConstraints(view: submitButton, anchorView: errorLabel)
        
        markLabel.text = " "
        markLabel.font = .boldSystemFont(ofSize: 17)
        markLabel.textColor = .white
        markLabel.textAlignment = .center
        containerView.addSubview(markLabel)
        activateLastViewConstraints(view: markLabel, anchorView: submitButton)
        
        multiplicationTableView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = multiplicationTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func submitButtonDidPressed() {
        presenter.submitButtonDidPressed()
    }
    
    func displayAll() {
        equationCounterLabel.text = "0/10"
        resultLabel.text = "Result:"
        resultField.isHidden = false
        errorLabel.text = " "
        markLabel.text = " "
        submitButton.setTitle("Solve", for: .normal)
    }
    
    func display(mark: String) {
        markLabel.text = mark
    }
    
    func display(error: String) {
        errorLabel.text = error
    }
    
    func display(counter: String) {
        equationCounterLabel.text = counter
    }
    
    func display(equation: String) {
        equationLabel.text = equation
    }
    
    func display(button: String) {
        submitButton.setTitle(button, for: .normal)
    }
}

private typealias PrivateMultiplicationTableViewController = MultiplicationTableViewController
private extension PrivateMultiplicationTableViewController {
    func activateFirstViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateMidViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.widthAnchor.constraint(equalToConstant: 250),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateLastViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
    
    func activateContainerViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
    }
}
