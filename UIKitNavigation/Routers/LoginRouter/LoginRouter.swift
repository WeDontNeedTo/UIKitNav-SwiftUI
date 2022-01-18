//
//  LoginRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import UIKit
import GXInject

class LoginRouter: RouterProtocol {
    // MARK: - Private vars
    @Injected private var loginVM: LoginViewModel
    private var navController: UINavigationController = UINavigationController()


    private lazy var enterCodeRouter: EnterCodeRouter = {
        EnterCodeRouter(navController: self.navController)
    }()

    // MARK: - Initialization
    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        let loginVC = LoginViewController()
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

