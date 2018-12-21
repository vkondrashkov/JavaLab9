
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
    private let busTicketCoordinator: BusTicketCoordinator
    private let headsOrTailsCoordinator: HeadsOrTailsCoordinator
    private let multiplicationTableCoordinator: MultiplicationTableCoordinator
    
    var coordinators: [Coordinator] {
        return [cardsCoordinator,
                calculatorCoordinator,
                busTicketCoordinator,
                headsOrTailsCoordinator,
                multiplicationTableCoordinator]
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
        
        let busTicketNavigation = UINavigationController()
        // tabBarIcon
        // tabBarItem
        busTicketNavigation.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        busTicketCoordinator = BusTicketCoordinator(navigation: busTicketNavigation)
        controllers.append(busTicketNavigation)
        
        let headsOrTailsNavigation = UINavigationController()
        let headsOrTailsTabBarIcon = UIImage(named: "headsOrTails")
        let headsOrTailsTabBarItem = UITabBarItem(title: "Heads or Tails", image: headsOrTailsTabBarIcon, tag: 3)
        headsOrTailsNavigation.tabBarItem = headsOrTailsTabBarItem
        headsOrTailsCoordinator = HeadsOrTailsCoordinator(navigation: headsOrTailsNavigation)
        controllers.append(headsOrTailsNavigation)
        
        let multiplicationTableNavigation = UINavigationController()
        // tabBarIcon
        // tabBarItem
        multiplicationTableNavigation.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        multiplicationTableCoordinator = MultiplicationTableCoordinator(navigation: multiplicationTableNavigation)
        controllers.append(multiplicationTableNavigation)
        
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
