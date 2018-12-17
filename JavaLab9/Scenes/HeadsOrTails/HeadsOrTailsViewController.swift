//
//  HeadsOrTailsViewController.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/16/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol HeadsOrTailsView: class {
    func display(coinName: String)
    func display(result: String)
}

class HeadsOrTailsViewController: UIViewController, HeadsOrTailsView {
    var presenter: HeadsOrTailsPresenter!
    
    private let coinAnimationDuration: Double = 5
    private let coinAnimationSteps: Double = 12
    private var coinPerformsAnimation = false
    
    private var headsOrTailsView = UIView(frame: .zero)
    private var containerView = UIView(frame: .zero)
    
    private var coin = UIImageView(frame: .zero)
    private var resultLabel = UILabel(frame: .zero)
    
    override func loadView() {
        headsOrTailsView.backgroundColor = UIColor(red: 38.0 / 255.0, green: 81.0 / 255.0, blue: 127.0 / 255.0, alpha: 1)
        
        coin.image = UIImage(named: "heads")
        containerView.addSubview(coin)
        activateCoinConstraints(view: coin)
        
        resultLabel.text = " "
        resultLabel.font = .boldSystemFont(ofSize: 24)
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
        containerView.addSubview(resultLabel)
        activateResultLabelConstraints(view: resultLabel, anchorView: coin)
        
        headsOrTailsView.addSubview(containerView)
        activateContainerViewConstraints(view: containerView)
        
        view = headsOrTailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heads or Tails"
        let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(coinImageDidTapped))
        coin.isUserInteractionEnabled = true
        coin.addGestureRecognizer(imageTapGestureRecognizer)
    }
    
    @objc func coinImageDidTapped() {
        resultLabel.text = " "
        changeCoinWithAnimation {
            self.presenter.coinImageDidTapped()
        }
    }
    
    func display(coinName: String) {
        let coinImage = UIImage(named: coinName)
        coin.image = coinImage
    }
    
    func display(result: String) {
        resultLabel.text = result
    }
    
    func changeCoinWithAnimation(presenterCall: @escaping () -> Void) {
        if coinPerformsAnimation { return }
        coinPerformsAnimation = true
        let coinAnimationStepDuration = coinAnimationDuration / coinAnimationSteps
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromBottom]
        DispatchQueue.global(qos: .userInteractive).async {
            for i in 0..<Int(self.coinAnimationSteps) {
                DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * coinAnimationStepDuration)) {
                    let coinImage = i % 2 == 0 ? UIImage(named: "tails") : UIImage(named: "heads")
                    self.coin.image = coinImage
                    UIView.transition(with: self.coin, duration: coinAnimationStepDuration, options: transitionOptions, animations: {
                        self.coin.isHidden = false
                    })
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + self.coinAnimationDuration) {
                presenterCall()
                UIView.transition(with: self.coin, duration: 1, options: transitionOptions, animations: {
                    self.coin.isHidden = false
                })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + self.coinAnimationDuration + 1) {
                self.coinPerformsAnimation = false
            }
        }
    }
}

private typealias PrivateHeadsOrTailsViewController = HeadsOrTailsViewController
private extension PrivateHeadsOrTailsViewController {
    func activateCoinConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.widthAnchor.constraint(equalToConstant: 250),
            view.heightAnchor.constraint(equalToConstant: 250)
            ])
    }
    
    func activateResultLabelConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 15),
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
