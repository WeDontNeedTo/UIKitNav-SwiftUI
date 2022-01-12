//
//  OnboardingRouter.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation
import SwiftUI

class OnboardingRouter: RouterProtocol {
    func start() -> UIViewController {
        let onboardingViewController = OnboardingViewController()
        return onboardingViewController
    }
}
