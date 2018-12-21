//
//  BusTicketViewController.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/20/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol BusTicketView: class {
    func display(result: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class BusTicketViewController: UIViewController, BusTicketView {
    var presenter: BusTicketPresenter!
    
    private var busTicketView = UIView(frame: .zero)
    private var containerView = UIView(frame: .zero)
    private var ticketLengthLabel = UILabel(frame: .zero)
    var ticketLengthTextField = UITextField(frame: .zero)
    private var submitButton = UIButton(frame: .zero)
    private var activityIndicator = UIActivityIndicatorView(frame: .zero)
    private var resultLabel = UILabel(frame: .zero)
    
    override func loadView() {
        busTicketView.backgroundColor = UIColor(red: 38.0 / 255.0, green: 81.0 / 255.0, blue: 127.0 / 255.0, alpha: 1)
        
        ticketLengthLabel.text = "Ticket's length"
        ticketLengthLabel.font = .boldSystemFont(ofSize: 17)
        ticketLengthLabel.textColor = .white
        containerView.addSubview(ticketLengthLabel)
        activateTicketLengtLabelConstraints(view: ticketLengthLabel)
        
        ticketLengthTextField.placeholder = "6"
        ticketLengthTextField.font = .boldSystemFont(ofSize: 17)
        ticketLengthTextField.borderStyle = .roundedRect
        ticketLengthTextField.autocorrectionType = .no
        ticketLengthTextField.keyboardType = .numberPad
        ticketLengthTextField.contentVerticalAlignment = .center
        containerView.addSubview(ticketLengthTextField)
        activateTicketLengthTextField(view: ticketLengthTextField, anchorView: ticketLengthLabel)
        
        submitButton.backgroundColor = UIColor(displayP3Red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        submitButton.setTitle("Find", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
        containerView.addSubview(submitButton)
        activateSubmitButtonConstraints(view: submitButton, anchorView: ticketLengthTextField)
        
        activityIndicator.style = .white
        submitButton.addSubview(activityIndicator)
        activateActivityIndicatorConstraints(view: activityIndicator)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 17)
        resultLabel.textColor = .white
        containerView.addSubview(resultLabel)
        activateResultLabetConstraints(view: resultLabel, anchorView: submitButton)
        
        busTicketView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = busTicketView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func display(result: String) {
        resultLabel.text = result
    }
    
    @objc func submitButtonDidPressed() {
        presenter.submitButtonDidPressed()
    }
    
    func showActivityIndicator() {
        submitButton.setTitle("", for: .normal)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        submitButton.setTitle("Find", for: .normal)
        activityIndicator.stopAnimating()
    }
}

private typealias PrivateBusTicketViewController = BusTicketViewController
private extension PrivateBusTicketViewController {
    func activateTicketLengtLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateTicketLengthTextField(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.widthAnchor.constraint(equalToConstant: 250),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateSubmitButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.heightAnchor.constraint(equalToConstant: 35),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateActivityIndicatorConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
    
    func activateResultLabetConstraints(view: UIView, anchorView: UIView) {
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
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
}
