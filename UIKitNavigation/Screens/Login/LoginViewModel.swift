//
//  LoginViewModel.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation

class LoginViewModel: BaseViewModel<Services>, ObservableObject {
    
    override init(services: Services) {
        super.init(services: services)
    }
    
    @Published var phoneNumber: String = ""
    @Published var smsCode: String = ""
    
    func logIn() {
        services.loginManager.logIn()
    }
}
