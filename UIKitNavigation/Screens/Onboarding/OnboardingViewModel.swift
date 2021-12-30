//
//  OnboardingViewModel.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation

enum LoadState {
    case idle
    case loading
    case fail
    case success
}

open class BaseViewModel<S> {
    public var services: S

    public init(services: S) {
        self.services = services
    }
}

class OnboardingViewModel: BaseViewModel<Services>, ObservableObject {
    
    private var presenter: OnboardingPresenter
    
    init(services: Services, presenter: OnboardingPresenter) {
        self.presenter = presenter
        super.init(services: services)
    }
    
    @Published var selection: Int = 0 
    @Published var onboardingData: [OnboardingModel] = []
    @Published var loadState: LoadState = .idle

    deinit {}

    func goToLogIn() {
        services.loginManager.onboardingShowed()
    }

    func getOnboardingData() {
        loadState = .loading
        presenter.getOnboardingData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.onboardingData = data
                self.loadState = .success
            case .failure(_):
                self.loadState = .fail
            }
        }
    }
}
