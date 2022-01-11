//
//  OnboardingInteractor.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation

protocol OnboardingInteractorProtocol {
    func getOnboardingData(handler: @escaping (Result<[OnboardingModel],Error>) -> Void)
}

class OnboardingInteractor: OnboardingInteractorProtocol {
    func getOnboardingData(handler: @escaping (Result<[OnboardingModel],Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            handler(.success(OnboardingModel.realData))
        }
    }
}


class StubOnboardingInteractor: OnboardingInteractorProtocol {
    func getOnboardingData(handler: @escaping (Result<[OnboardingModel],Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            handler(.success(OnboardingModel.mockData))
        }
    }
}
