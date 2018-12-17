
//
//  TabBarCoordinator.swift
//  JavaLab9
//
//  Created by Vladislav Kondrashkov on 12/13/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class TabBarCoordinator:  Coordinator {
    private let window: UIWindow
    private let tabBarController: UITabBarController
    
    private let cardsCoordinator: CardsCoordinator
    private let calculatorCoordinator: CalculatorCoordinator
    private let headsOrTailsCoordinator: HeadsOrTailsCoordinator
    
    var coordinators: [Coordinator] {
        return [cardsCoordinator, calculatorCoordinator, headsOrTailsCoordinator]
    }

    init(window: UIWindow) {
        self.window = window
        tabBarController = UITabBarController()
        var controllers: [UINavigationController] = []
        
        let cardsNavigation = UINavigationController()
        let cardsTabBarIcon = UIImage(named: "cards")
        let cardsTabBarItem = UITabBarItem(title: "Cards", image: cardsTabBarIcon, tag: 0)
        cardsNavigation.tabBarItem = cardsTabBarItem
        cardsCoordinator = CardsCoordinator(navigation: cardsNavigation)
        controllers.append(cardsNavigation)
        
        let calculatorNavigation = UINavigationController()
        // tabBarIcon
        // tabBarItem
        calculatorNavigation.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1) // Temporary
        calculatorCoordinator = CalculatorCoordinator(navigation: calculatorNavigation)
        controllers.append(calculatorNavigation)
        
        let headsOrTailsNavigation = UINavigationController()
        let headsOrTailsTabBarIcon = UIImage(named: "headsOrTails")
        let headsOrTailsTabBarItem = UITabBarItem(title: "Heads or Tails", image: headsOrTailsTabBarIcon, tag: 2)
        headsOrTailsNavigation.tabBarItem = headsOrTailsTabBarItem
        headsOrTailsCoordinator = HeadsOrTailsCoordinator(navigation: headsOrTailsNavigation)
        controllers.append(headsOrTailsNavigation)
        
        tabBarController.viewControllers = controllers
    }
    
    
    func start() {
        for coordinator in coordinators {
            coordinator.start()
        }

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
