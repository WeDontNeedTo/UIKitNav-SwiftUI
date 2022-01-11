//
//  MainTabBarRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import SwiftUI

class MainTabBarRouter: RouterProtocol {
    // MARK: - Private vars

    // MARK: - Initialization

    private lazy var homeRouter: HomeRouter = {
        HomeRouter()
    }()
    
    private lazy var settingsRouter: SettingsRouter = {
        SettingsRouter()
    }()

    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        MainTabBar(viewControllers: [
            homeRouter.start(),
            settingsRouter.start()
        ])
    }
}
