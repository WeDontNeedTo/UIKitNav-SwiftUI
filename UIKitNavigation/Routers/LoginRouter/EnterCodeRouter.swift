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

    private var navController: UINavigationController
    @Injected private var loginVM: LoginViewModel

    // MARK: - Initialization

    init(navController: UINavigationController) {
        self.navController = navController
    }

    deinit {}

    // MARK: - Methods

    func start() {
        let enterCodeVC = EnterCodeViewController()
        enterCodeVC.delegate = self
        navController.pushViewController(enterCodeVC, animated: true)
    }
}

extension EnterCodeRouter: EnterCodeViewControllerDelegate {
    func didEnterCode() {
        navController.pushViewController(InfoViewController(), animated: true)
    }
}
