//
//  LoginRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import UIKit

class LoginRouter: RouterProtocol {
    // MARK: - Private vars

    private var services: Services
    private var navController: UINavigationController = UINavigationController()
    private var loginVM: LoginViewModel

    // MARK: - Initialization

    init(services: Services) {
        self.services = services
        self.loginVM = LoginViewModel(services: self.services)
    }
    
    private lazy var enterCodeRouter: EnterCodeRouter = {
        EnterCodeRouter(services: self.services, navController: self.navController, loginVM: self.loginVM)
    }()

    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        let loginVC = LoginViewController(viewModel: loginVM)
        loginVC.delegate = self
        navController.pushViewController(loginVC, animated: true)
        return navController
    }
}

extension LoginRouter: LoginViewControllerDelegate {
    func didEnterPhoneNumber() {
        enterCodeRouter.start()
    }
}

