//
//  MainTabBar.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import Foundation
import UIKit

class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            generateNavigationController(rootVC: HomeViewController(), title: "Home", image: UIImage(systemName: "house")!),
            generateNavigationController(rootVC: SettingsViewController(), title: "Settings", image: UIImage(systemName: "gear")!)
        ]
    }
    
    
    private func generateNavigationController(rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.navigationBar.topItem?.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
