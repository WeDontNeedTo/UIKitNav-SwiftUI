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

class OnboardingViewModel: ObservableObject {
    
    private var presenter: OnboardingPresenter
    @Injected var loginManager: LoginManager
    
    init(presenter: OnboardingPresenter) {
        self.presenter = presenter
    }
    
    @Published var selection: Int = 0 
    @Published var onboardingData: [OnboardingModel] = []
    @Published var loadState: LoadState = .idle

    deinit {}

    func goToLogIn() {
        loginManager.onboardingShowed()
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
