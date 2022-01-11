//
//  LoginViewModel.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Injected var loginManager: LoginManager
    
    @Published var phoneNumber: String = ""
    @Published var smsCode: String = ""
    
    func logIn() {
        loginManager.logIn()
    }
}
