//
//  CalculatorCoordinator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/17/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class CalculatorCoordinator: Coordinator {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let view = CalculatorViewController()
        let presenter = CalculatorPresenterImplementation(view: view)
        view.presenter = presenter
        navigation.viewControllers = [view]
    }
}
