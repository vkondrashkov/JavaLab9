//
//  CardsViewController.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/14/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol CardsView: class {
    func display(cardName: String)
}

class CardsViewController: UIViewController, CardsView {
    var presenter: CardsPresenter!
    
    private let CARD_HEIGHT_TO_WIDTH_GRADE: CGFloat = 0.704;
    
    private var cardsView = UIView(frame: .zero)
    private var containerView = UIView(frame: .zero)
    
    private var cardImage = UIImageView(frame: .zero)
    private var cardSuitLabel = UILabel(frame: .zero)
    var cardSuitField = UITextField(frame: .zero)
    private var cardValueLabel = UILabel(frame: .zero)
    var cardValueField = UITextField(frame: .zero)
    
    private var throwCardButton = UIButton(frame: .zero)
    private var throwRandomCardButton = UIButton(frame: .zero)

    override func loadView() {
        cardsView.backgroundColor = UIColor(red: 38.0 / 255.0, green: 81.0 / 255.0, blue: 127.0 / 255.0, alpha: 1)
        
        cardImage.image = UIImage(named: "cardBack")
        containerView.addSubview(cardImage)
        activateCardImageConstraints(view: cardImage)
        
        cardSuitLabel.text = "Suit"
        cardSuitLabel.font = .boldSystemFont(ofSize: 17)
        cardSuitLabel.textColor = .white
        containerView.addSubview(cardSuitLabel)
        activateCardSuitLabelConstraints(view: cardSuitLabel, anchorView: cardImage)
        
        cardSuitField.placeholder = "1-4" // Temporary
        cardSuitField.font = .boldSystemFont(ofSize: 17)
        cardSuitField.borderStyle = .roundedRect
        cardSuitField.autocorrectionType = .no
        cardSuitField.keyboardType = .numberPad
        cardSuitField.contentVerticalAlignment = .center
        containerView.addSubview(cardSuitField)
        activateCardSuitFieldConstraints(view: cardSuitField, anchorView: cardSuitLabel)
        
        cardValueLabel.text = "Value"
        cardValueLabel.font = .boldSystemFont(ofSize: 17)
        cardValueLabel.textColor = .white
        containerView.addSubview(cardValueLabel)
        activateCardValueLabelConstraints(view: cardValueLabel, anchorView: cardSuitField)
        
        cardValueField.placeholder = "6-14" // Temporary
        cardValueField.font = .boldSystemFont(ofSize: 17)
        cardValueField.borderStyle = .roundedRect
        cardValueField.autocorrectionType = .no
        cardValueField.keyboardType = .numberPad
        cardValueField.contentVerticalAlignment = .center
        containerView.addSubview(cardValueField)
        activateCardValueFieldConstraints(view: cardValueField, anchorView: cardValueLabel)
        
        throwCardButton.backgroundColor = UIColor(red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        throwCardButton.setTitle("Throw", for: .normal)
        throwCardButton.layer.cornerRadius = 5
        throwCardButton.addTarget(self, action: #selector(throwCardButtonDidPressed(sender:)), for: .touchUpInside)
        containerView.addSubview(throwCardButton)
        activateThrowCardButtonConstraints(view: throwCardButton, anchorView: cardValueField)
        
        throwRandomCardButton.backgroundColor = UIColor(red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        throwRandomCardButton.setTitle("Random", for: .normal)
        throwRandomCardButton.layer.cornerRadius = 5
        throwRandomCardButton.addTarget(self, action: #selector(throwRandomCardButtonDidPressed(sender:)), for: .touchUpInside)
        containerView.addSubview(throwRandomCardButton)
        activateThrowRandomCardButtonConstraints(view: throwRandomCardButton, anchorView: throwCardButton)
        
        cardsView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = cardsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cards" // Probably should be in loadView()
        addKeyboardObservers()
    }
    
    @objc func throwCardButtonDidPressed(sender: UIButton) {
        presenter.throwCardButtonDidPressed()
    }
    
    @objc func throwRandomCardButtonDidPressed(sender: UIButton) {
        presenter.throwRandomCardButtonDidPressed()
    }
    
    func display(cardName: String) {
        let cardBack = UIImage(named: cardName)
        cardImage.image = cardBack
    }
}

private typealias PrivateCardsViewController = CardsViewController
private extension PrivateCardsViewController {
    func activateCardImageConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.heightAnchor.constraint(equalToConstant: 225),
            view.widthAnchor.constraint(equalToConstant: 158)
            ])
    }
    
    func activateCardSuitLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateCardSuitFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateCardValueLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateCardValueFieldConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateThrowCardButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.widthAnchor.constraint(equalToConstant: 100),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
    
    func activateThrowRandomCardButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.topAnchor),
            view.leadingAnchor.constraint(equalTo: anchorView.trailingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.widthAnchor.constraint(equalToConstant: 100),
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
