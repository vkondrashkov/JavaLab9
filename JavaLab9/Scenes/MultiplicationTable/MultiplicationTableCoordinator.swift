
//
//  MultiplicationTableCoordinator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/20/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class MultiplicationTableCoordinator: Coordinator {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let view = MultiplicationTableViewController()
        let presenter = MultiplicationTablePresenterImplementation(view: view)
        view.presenter = presenter
        navigation.viewControllers = [view]
    }
}
