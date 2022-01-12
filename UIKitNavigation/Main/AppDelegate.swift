//
//  AppDelegate.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITabBar.appearance().tintColor = .mainColor
        UITabBar.appearance().barTintColor = UIColor.white
        
        let dependencies = Dependencies {
            registerDataServices()
            registerOnboarding()
            registerLoginServices()
            registerHome()
        }
        // Resolve only when it's needed
        dependencies.build()
    
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

 // MARK: - register DI
extension AppDelegate {
    
    private func registerDataServices() -> [Dependency] {
        DependencyBuilder.buildBlock(
            Dependency { HomeAPIManager() },
            Dependency { HomeDBManager() }
        )
    }
    
    private func registerOnboarding() -> [Dependency] {
        DependencyBuilder.buildBlock(
            Dependency { OnboardingInteractor() },
            Dependency { OnboardingPresenter() },
            Dependency { OnboardingViewModel() }
        )
    }
    
    private func registerLoginServices() -> [Dependency] {
        DependencyBuilder.buildBlock(
            Dependency { AppLoginManager() },
            Dependency { LoginViewModel() }
        )
    }
    
    private func registerHome() -> [Dependency] {
        DependencyBuilder.buildBlock(
            Dependency { HomeInteracor() },
            Dependency { HomePresenter() },
            Dependency { HomeViewModel() }
        )
    }
}
