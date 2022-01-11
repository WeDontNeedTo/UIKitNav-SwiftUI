//
//  OnboardingRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation
import SwiftUI

class OnboardingRouter: RouterProtocol {
    // MARK: - Private vars
    @Injected private var onboardingViewController: OnboardingViewController

    // MARK: - Initialization
    
    init() {}

    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        return onboardingViewController
    }
}
