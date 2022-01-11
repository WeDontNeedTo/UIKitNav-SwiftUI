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
    private var navController: UINavigationController = UINavigationController()
    private var loginVM: LoginViewModel = LoginViewModel()
    
    private lazy var enterCodeRouter: EnterCodeRouter = {
        EnterCodeRouter(navController: self.navController, loginVM: self.loginVM)
    }()

    // MARK: - Initialization

  

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

