//
//  AppCoordinator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/13/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    private var window: UIWindow!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }
}
