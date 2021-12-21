//
//  AppServices.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation

protocol Services {
    var loginManager: LoginManager { get }
}

class AppServices: Services {
    var loginManager: LoginManager

    init() {
        loginManager = AppLoginManager()
    }
}
