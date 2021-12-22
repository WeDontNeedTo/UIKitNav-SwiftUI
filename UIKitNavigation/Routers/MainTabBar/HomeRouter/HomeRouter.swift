//
//  HomeRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import SwiftUI

class HomeRouter: RouterProtocol {
    // MARK: - Private vars

    private var services: Services
    private var navController: UINavigationController = UINavigationController()


    // MARK: - Initialization

    init(services: Services) {
        self.services = services
    }

    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        let settingsVC = HomeViewController()
        navController.tabBarItem.title = "Home"
        navController.tabBarItem.image = UIImage(systemName: "house")
        navController.pushViewController(settingsVC, animated: true)
        return navController
    }
}
