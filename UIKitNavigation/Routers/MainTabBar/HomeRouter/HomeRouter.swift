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
    private var navController: UINavigationController = UINavigationController()


    // MARK: - Initialization


    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        let homeVC = HomeViewController(viewModel: HomeViewModel(presenter: HomePresenter() ))
        homeVC.delegate = self
        navController.tabBarController?.tabBar.tintColor = .green
        navController.tabBarItem.title = "Home"
        navController.tabBarItem.image = UIImage(systemName: "house")
        navController.pushViewController(homeVC, animated: true)
        return navController
    }
}

extension HomeRouter: HomeViewControllerDelegate {
    func didTapAlcoCard(with drink: AlcoDrink) {
        let detailVC = DetailHomeViewController()
        detailVC.drink = drink
        navController.pushViewController(detailVC, animated: true)
    }
}
