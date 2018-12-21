
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
        let cardsTabBarItem = UITabBarItem(title: "Cards", image: nil, tag: 0)
        cardsNavigation.tabBarItem = cardsTabBarItem
        cardsCoordinator = CardsCoordinator(navigation: cardsNavigation)
        controllers.append(cardsNavigation)
        
        let calculatorNavigation = UINavigationController()
        let calculatorTabBarItem = UITabBarItem(title: "Calculator", image: nil, tag: 1)
        calculatorNavigation.tabBarItem = calculatorTabBarItem
        calculatorCoordinator = CalculatorCoordinator(navigation: calculatorNavigation)
        controllers.append(calculatorNavigation)
        
        let busTicketNavigation = UINavigationController()
        let busTicketTabBarItem = UITabBarItem(title: "Bus ticket", image: nil, tag: 2)
        busTicketNavigation.tabBarItem = busTicketTabBarItem
        busTicketCoordinator = BusTicketCoordinator(navigation: busTicketNavigation)
        controllers.append(busTicketNavigation)
        
        let headsOrTailsNavigation = UINavigationController()
        let headsOrTailsTabBarIcon = UIImage(named: "headsOrTails")
        let headsOrTailsTabBarItem = UITabBarItem(title: "Heads or Tails", image: nil, tag: 3)
        headsOrTailsNavigation.tabBarItem = headsOrTailsTabBarItem
        headsOrTailsCoordinator = HeadsOrTailsCoordinator(navigation: headsOrTailsNavigation)
        controllers.append(headsOrTailsNavigation)
        
        let multiplicationTableNavigation = UINavigationController()
        let multiplicationTabBarItem = UITabBarItem(title: "Multiplication table", image: nil, tag: 4)
        multiplicationTableNavigation.tabBarItem = multiplicationTabBarItem
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
