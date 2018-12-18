//
//  CalculatorViewController.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/17/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol CalculatorView: class {
    func display(result: String)
}

class CalculatorViewController: UIViewController, CalculatorView {
    var presenter: CalculatorPresenter!
    
    // 5 means offset between any buttons and screen borders
    private var buttonOffset: CGFloat = 15
    private let buttonSize = (UIScreen.main.bounds.width - 15 * 5) / 4
    
    private var calculatorView = UIView(frame: .zero)
    private var buttonsTableView = UIView(frame: .zero)
    
    private var firstButtonRow = UIView(frame: .zero)
    private var secondButtonRow = UIView(frame: .zero)
    private var thirdButtonRow = UIView(frame: .zero)
    private var fourthButtonRow = UIView(frame: .zero)
    private var fifthButtonRow = UIView(frame: .zero)
    
    private var clearButton = UIButton(frame: .zero)
    private var emptyButton1 = UIButton(frame: .zero)
    private var modulusButton = UIButton(frame: .zero)
    private var divideButton = UIButton(frame: .zero)
    
    private var sevenButton = UIButton(frame: .zero)
    private var eightButton = UIButton(frame: .zero)
    private var nineButton = UIButton(frame: .zero)
    private var multiplicationButton = UIButton(frame: .zero)
    
    private var fourButton = UIButton(frame: .zero)
    private var fiveButton = UIButton(frame: .zero)
    private var sixButton = UIButton(frame: .zero)
    private var subtractionButton = UIButton(frame: .zero)
    
    private var oneButton = UIButton(frame: .zero)
    private var twoButton = UIButton(frame: .zero)
    private var threeButton = UIButton(frame: .zero)
    private var additionButton = UIButton(frame: .zero)
    
    private var zeroButton = UIButton(frame: .zero)
    private var pointButton = UIButton(frame: .zero)
    private var equalsButton = UIButton(frame: .zero)
    
    var resultLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorView.backgroundColor = UIColor(red: 38.0 / 255.0, green: 81.0 / 255.0, blue: 127.0 / 255.0, alpha: 1)
        
        clearButton.backgroundColor = .lightGray
        clearButton.setTitle("AC", for: .normal)
        clearButton.layer.cornerRadius = buttonSize / 2
        clearButton.tag = 11
        clearButton.addTarget(self, action: #selector(signButtonDidPressed), for: .touchUpInside)
        firstButtonRow.addSubview(clearButton)
        activateFirstButtonConstraints(view: clearButton)
        
        emptyButton1.backgroundColor = .lightGray
        emptyButton1.setTitle(" ", for: .normal)
        emptyButton1.layer.cornerRadius = buttonSize / 2
        firstButtonRow.addSubview(emptyButton1)
        activateMidButtonConstraints(view: emptyButton1, anchorView: clearButton)
        
        modulusButton.backgroundColor = .orange
        modulusButton.setTitle("%", for: .normal)
        modulusButton.layer.cornerRadius = buttonSize / 2
        modulusButton.tag = 12
        modulusButton.addTarget(self, action: #selector(signButtonDidPressed(_:)), for: .touchUpInside)
        firstButtonRow.addSubview(modulusButton)
        activateMidButtonConstraints(view: modulusButton, anchorView: emptyButton1)
        
        divideButton.backgroundColor = .orange
        divideButton.setTitle("/", for: .normal)
        divideButton.layer.cornerRadius = buttonSize / 2
        divideButton.tag = 13
        divideButton.addTarget(self, action: #selector(signButtonDidPressed), for: .touchUpInside)
        firstButtonRow.addSubview(divideButton)
        activateLastButtonConstraints(view: divideButton, anchorView: modulusButton)
        
        buttonsTableView.addSubview(firstButtonRow)
        activateFirstButtonsRowConstraints(view: firstButtonRow)
        
        sevenButton.backgroundColor = .gray
        sevenButton.setTitle("7", for: .normal)
        sevenButton.layer.cornerRadius = buttonSize / 2
        sevenButton.tag = 7
        sevenButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        secondButtonRow.addSubview(sevenButton)
        activateFirstButtonConstraints(view: sevenButton)
        
        eightButton.backgroundColor = .gray
        eightButton.setTitle("8", for: .normal)
        eightButton.layer.cornerRadius = buttonSize / 2
        eightButton.tag = 8
        eightButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        secondButtonRow.addSubview(eightButton)
        activateMidButtonConstraints(view: eightButton, anchorView: sevenButton)
        
        nineButton.backgroundColor = .gray
        nineButton.setTitle("9", for: .normal)
        nineButton.layer.cornerRadius = buttonSize / 2
        nineButton.tag = 9
        nineButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        secondButtonRow.addSubview(nineButton)
        activateMidButtonConstraints(view: nineButton, anchorView: eightButton)
        
        multiplicationButton.backgroundColor = .orange
        multiplicationButton.setTitle("x", for: .normal)
        multiplicationButton.layer.cornerRadius = buttonSize / 2
        multiplicationButton.tag = 14
        multiplicationButton.addTarget(self, action: #selector(signButtonDidPressed), for: .touchUpInside)
        secondButtonRow.addSubview(multiplicationButton)
        activateLastButtonConstraints(view: multiplicationButton, anchorView: nineButton)
        
        buttonsTableView.addSubview(secondButtonRow)
        activateMidButtonsRowConstraints(view: secondButtonRow, anchorView: firstButtonRow)
        
        fourButton.backgroundColor = .gray
        fourButton.setTitle("4", for: .normal)
        fourButton.layer.cornerRadius = buttonSize / 2
        fourButton.tag = 4
        fourButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        thirdButtonRow.addSubview(fourButton)
        activateFirstButtonConstraints(view: fourButton)
        
        fiveButton.backgroundColor = .gray
        fiveButton.setTitle("5", for: .normal)
        fiveButton.layer.cornerRadius = buttonSize / 2
        fiveButton.tag = 5
        fiveButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        thirdButtonRow.addSubview(fiveButton)
        activateMidButtonConstraints(view: fiveButton, anchorView: fourButton)
        
        sixButton.backgroundColor = .gray
        sixButton.setTitle("6", for: .normal)
        sixButton.layer.cornerRadius = buttonSize / 2
        sixButton.tag = 6
        sixButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        thirdButtonRow.addSubview(sixButton)
        activateMidButtonConstraints(view: sixButton, anchorView: fiveButton)
        
        subtractionButton.backgroundColor = .orange
        subtractionButton.setTitle("-", for: .normal)
        subtractionButton.layer.cornerRadius = buttonSize / 2
        subtractionButton.tag = 15
        subtractionButton.addTarget(self, action: #selector(signButtonDidPressed), for: .touchUpInside)
        thirdButtonRow.addSubview(subtractionButton)
        activateLastButtonConstraints(view: subtractionButton, anchorView: sixButton)
        
        buttonsTableView.addSubview(thirdButtonRow)
        activateMidButtonsRowConstraints(view: thirdButtonRow, anchorView: secondButtonRow)
        
        oneButton.backgroundColor = .gray
        oneButton.setTitle("1", for: .normal)
        oneButton.layer.cornerRadius = buttonSize / 2
        oneButton.tag = 1
        oneButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        fourthButtonRow.addSubview(oneButton)
        activateFirstButtonConstraints(view: oneButton)
        
        twoButton.backgroundColor = .gray
        twoButton.setTitle("2", for: .normal)
        twoButton.layer.cornerRadius = buttonSize / 2
        twoButton.tag = 2
        twoButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        fourthButtonRow.addSubview(twoButton)
        activateMidButtonConstraints(view: twoButton, anchorView: oneButton)
        
        threeButton.backgroundColor = .gray
        threeButton.setTitle("3", for: .normal)
        threeButton.layer.cornerRadius = buttonSize / 2
        threeButton.tag = 3
        threeButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        fourthButtonRow.addSubview(threeButton)
        activateMidButtonConstraints(view: threeButton, anchorView: twoButton)
        
        additionButton.backgroundColor = .orange
        additionButton.setTitle("+", for: .normal)
        additionButton.layer.cornerRadius = buttonSize / 2
        additionButton.tag = 16
        additionButton.addTarget(self, action: #selector(signButtonDidPressed), for: .touchUpInside)
        fourthButtonRow.addSubview(additionButton)
        activateLastButtonConstraints(view: additionButton, anchorView: threeButton)
        
        buttonsTableView.addSubview(fourthButtonRow)
        activateMidButtonsRowConstraints(view: fourthButtonRow, anchorView: thirdButtonRow)
        
        zeroButton.backgroundColor = .gray
        zeroButton.setTitle("0", for: .normal)
        zeroButton.layer.cornerRadius = buttonSize / 2
        zeroButton.tag = 0
        zeroButton.addTarget(self, action: #selector(numberButtonDidPressed), for: .touchUpInside)
        fifthButtonRow.addSubview(zeroButton)
        activateZeroButtonConstraints(view: zeroButton)
        
        pointButton.backgroundColor = .gray
        pointButton.setTitle(".", for: .normal)
        pointButton.layer.cornerRadius = buttonSize / 2
        pointButton.tag = 10
        pointButton.addTarget(self, action: #selector(numberButtonDidPressed(_:)), for: .touchUpInside)
        fifthButtonRow.addSubview(pointButton)
        activateMidButtonConstraints(view: pointButton, anchorView: zeroButton)
        
        equalsButton.backgroundColor = .orange
        equalsButton.setTitle("=", for: .normal)
        equalsButton.layer.cornerRadius = buttonSize / 2
        equalsButton.tag = 17
        equalsButton.addTarget(self, action: #selector(signButtonDidPressed(_:)), for: .touchUpInside)
        fifthButtonRow.addSubview(equalsButton)
        activateLastButtonConstraints(view: equalsButton, anchorView: pointButton)
        
        buttonsTableView.addSubview(fifthButtonRow)
        activateLastButtonsRowConstraints(view: fifthButtonRow, anchorView: fourthButtonRow)
        
        calculatorView.addSubview(buttonsTableView)
        activateButtonsTableViewConstraints(view: buttonsTableView)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 48)
        resultLabel.textColor = .white
        resultLabel.textAlignment = .right
        calculatorView.addSubview(resultLabel)
        activateResultLabelConstraints(view: resultLabel, anchorView: buttonsTableView)
        
        view = calculatorView
    }
    
    @objc func numberButtonDidPressed(_ sender: UIButton) {
        let tag = sender.tag
        presenter.numberButtonDidPressed(tag: tag)
    }
    
    @objc func signButtonDidPressed(_ sender: UIButton) {
        let tag = sender.tag
        presenter.signButtonDidPressed(tag: tag)
    }
    
    func display(result: String) {
        resultLabel.text = result
    }
}

private typealias PrivateCalculatorViewController = CalculatorViewController
private extension PrivateCalculatorViewController {
    func activateZeroButtonConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: buttonOffset),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.widthAnchor.constraint(equalToConstant: buttonSize * 2 + buttonOffset),
            view.heightAnchor.constraint(equalToConstant: buttonSize)
            ])
    }
    
    func activateFirstButtonConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: buttonOffset),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.widthAnchor.constraint(equalToConstant: buttonSize),
            view.heightAnchor.constraint(equalToConstant: buttonSize)
            ])
    }
    
    func activateMidButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: anchorView.trailingAnchor, constant: buttonOffset),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.widthAnchor.constraint(equalToConstant: buttonSize),
            view.heightAnchor.constraint(equalToConstant: buttonSize)
            ])
    }
    
    func activateLastButtonConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: anchorView.trailingAnchor, constant: buttonOffset),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -buttonOffset),
            view.widthAnchor.constraint(equalToConstant: buttonSize),
            view.heightAnchor.constraint(equalToConstant: buttonSize)
            ])
    }
    
    func activateFirstButtonsRowConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateMidButtonsRowConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: buttonOffset),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateLastButtonsRowConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: buttonOffset),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -buttonOffset)
            ])
    }
    
    func activateButtonsTableViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor),
            view.topAnchor.constraint(greaterThanOrEqualTo: superview.safeAreaLayoutGuide.topAnchor)
            ])
    }
    
    func activateResultLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: anchorView.topAnchor, constant: -buttonOffset),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: buttonOffset),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -buttonOffset),
            view.topAnchor.constraint(greaterThanOrEqualTo: superview.safeAreaLayoutGuide.topAnchor)
            ])
    }
}
