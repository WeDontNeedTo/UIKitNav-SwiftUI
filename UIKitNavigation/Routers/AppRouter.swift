//
//  AppRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation
import UIKit
import SwiftUI
import Combine

enum AppRouterScreen {
    case onboarding
    case login
    case tab
}

public protocol RouterProtocol: ObservableObject {}

class AppRouter: RouterProtocol {
    let window: UIWindow
    private var services: Services
    private var anyCancellables = Set<AnyCancellable>()

    @Published var screen: AppRouterScreen = .tab
    
    private lazy var onBoardingRouter: OnboardingRouter = {
        OnboardingRouter(services: self.services)
    }()
    
    private lazy var mainTabBarRouter: MainTabBarRouter = {
        MainTabBarRouter(services: self.services)
    }()
    
    private lazy var loginRouter: LoginRouter = {
        LoginRouter(services: self.services)
    }()


    init(window: UIWindow, services: Services) {
        self.window = window
        self.services = services
        setBindings()
    }
    
    private func setBindings() {
        services.loginManager.state.$loggedIn.sink { [weak self] value in
            guard let self = self else { return }
            if self.services.loginManager.state.isShowedOnboarding {
                self.screen = value ? .tab : .login
            } else {
                self.screen = .onboarding
            }
            self.start()
        }
        .store(in: &anyCancellables)
    }
    
    func start() {
        switch screen {
        case .onboarding:
            window.rootViewController = onBoardingRouter.showOnboarding()
        case .tab:
            window.rootViewController = mainTabBarRouter.showTabBar()
        case .login:
            window.rootViewController = loginRouter.start()
        }
        window.makeKeyAndVisible()
    }

}
