//
//  MainTabBar.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import Foundation
import UIKit

class MainTabBar: UITabBarController {
    
    private var tabs: [UIViewController] = []
    
    init(viewControllers: [UIViewController]) {
        self.tabs = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = self.tabs
    }

    
}
