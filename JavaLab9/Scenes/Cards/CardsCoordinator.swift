//
//  CardsCoordinator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/14/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class CardsCoordinator: Coordinator {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let view = CardsViewController()
        let presenter = CardsPresenterImplementation(view: view)
        view.presenter = presenter
        navigation.viewControllers = [view]
    }
}
