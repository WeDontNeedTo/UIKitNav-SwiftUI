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

    private var services: Services

    // MARK: - Initialization

    init(services: Services) {
        self.services = services
    }

    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        MainTabBar()
    }
}
