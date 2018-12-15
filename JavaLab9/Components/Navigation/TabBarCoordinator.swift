
//
//  TabBarCoordinator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/13/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TabBarCoordinator:  Coordinator {
    let window: UIWindow
    let tabBarController: UITabBarController
    var rootViewController: UITabBarController {
        return tabBarController;
    }
    
    private let cardsCoordinator: CardsCoordinator
    
    var coordinators: [Coordinator] {
        return [cardsCoordinator]
    }

    init(window: UIWindow) {
        self.window = window
        tabBarController = UITabBarController()
        var controllers: [UINavigationController] = []
        
        let cardsNavigation = UINavigationController()
        cardsCoordinator = CardsCoordinator(navigation: cardsNavigation)
        cardsCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        controllers.append(cardsCoordinator.rootViewController)
        
        tabBarController.viewControllers = controllers
    }
    
    
    func start() {
        cardsCoordinator.start()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
