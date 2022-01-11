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


    // MARK: - Initialization



    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        let viewModel = OnboardingViewModel(presenter: OnboardingPresenter())
        return OnboardingViewController(viewModel: viewModel)
    }
}
