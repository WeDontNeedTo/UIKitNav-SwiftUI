//
//  OnboardingPresenter.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation

class OnboardingPresenter {
    
    @Injected private var interactor: OnboardingInteractorProtocol
    
    func getOnboardingData(handler: @escaping (Result<[OnboardingModel],Error>) -> Void) {
        interactor.getOnboardingData { result in
            switch result {
            case .success(let data):
                handler(.success(data))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}


