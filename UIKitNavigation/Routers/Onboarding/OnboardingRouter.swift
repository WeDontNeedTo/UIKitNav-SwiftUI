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

    private var services: Services

    // MARK: - Initialization

    init(services: Services) {
        self.services = services
    }

    deinit {}

    // MARK: - Methods

    func start() -> UIViewController {
        let viewModel = OnboardingViewModel(services: services, presenter: OnboardingPresenter(interactor: OnboardingInteractor()))
        return OnboardingViewController(viewModel: viewModel)
    }
}
