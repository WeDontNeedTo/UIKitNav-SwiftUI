//
//  EnterCodeRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import UIKit

class EnterCodeRouter: RouterProtocol {
    // MARK: - Private vars

    private var services: Services
    private var navController: UINavigationController
    private var loginVM: LoginViewModel

    // MARK: - Initialization

    init(services: Services,  navController: UINavigationController, loginVM: LoginViewModel) {
        self.services = services
        self.navController = navController
        self.loginVM = loginVM
    }

    deinit {}

    // MARK: - Methods

    func start() {
        let enterCodeVC = EnterCodeViewController(viewModel: self.loginVM)
        enterCodeVC.delegate = self
        navController.pushViewController(enterCodeVC, animated: true)
    }
}

extension EnterCodeRouter: EnterCodeViewControllerDelegate {
    func didEnterCode() {
        navController.pushViewController(InfoViewController(viewModel: self.loginVM), animated: true)
    }
}
