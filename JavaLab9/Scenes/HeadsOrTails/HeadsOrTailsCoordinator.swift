//
//  HeadsOrTailsCoordinator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/16/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class HeadsOrTailsCoordinator: Coordinator {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let view = HeadsOrTailsViewController()
        let presenter = HeadsOrTailsPresenterImplementation(view: view)
        view.presenter = presenter
        navigation.viewControllers = [view]
    }
}
