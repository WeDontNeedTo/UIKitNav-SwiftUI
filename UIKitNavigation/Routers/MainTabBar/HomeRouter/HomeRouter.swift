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
        let homeVC = HomeViewController(viewModel: HomeViewModel(services: self.services, presenter: HomePresenter(interacor: HomeInteracor())))
        navController.tabBarController?.tabBar.tintColor = .green
        navController.tabBarItem.title = "Home"
        navController.tabBarItem.image = UIImage(systemName: "house")
        navController.pushViewController(homeVC, animated: true)
        return navController
    }
}