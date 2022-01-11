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
    private var anyCancellables = Set<AnyCancellable>()
    
    @Injected var loginManager: LoginManager

    @Published var screen: AppRouterScreen = .tab
    
    private lazy var onBoardingRouter: OnboardingRouter = {
        OnboardingRouter()
    }()
    
    private lazy var mainTabBarRouter: MainTabBarRouter = {
        MainTabBarRouter()
    }()
    
    private lazy var loginRouter: LoginRouter = {
        LoginRouter()
    }()


    init(window: UIWindow) {
        self.window = window
        setBindings()
    }
    
    private func setBindings() {
        loginManager.state.$loggedIn.sink { [weak self] value in
            guard let self = self else { return }
            if self.loginManager.state.isShowedOnboarding {
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
            window.switchRootViewController(onBoardingRouter.start())
        case .tab:
            window.switchRootViewController(mainTabBarRouter.start())
        case .login:
            window.switchRootViewController(loginRouter.start())
        }
        window.makeKeyAndVisible()
    }

}
