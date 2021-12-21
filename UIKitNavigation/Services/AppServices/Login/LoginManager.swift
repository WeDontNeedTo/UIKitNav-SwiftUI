//
//  LoginManager.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation

public protocol LoginManager {
    var state: LoginState { get }
    func logIn()
    func logOut()
    func onboardingShowed()
}

public class LoginState: ObservableObject {
    @Published var loggedIn: Bool = false
    @Published var isShowedOnboarding: Bool = false

}

class AppLoginManager: LoginManager {
    public var state = LoginState()

    init() {}

    public func logIn() {
        state.loggedIn = true
    }

    public func logOut() {
        state.loggedIn = false
    }
    
    public func onboardingShowed() {
        state.isShowedOnboarding = true
        state.loggedIn = false
    }
}
