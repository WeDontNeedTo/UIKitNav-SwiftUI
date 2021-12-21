//
//  ViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubSwiftUIView(HomeView(pushToDetailVC: {
            self.navigationController?.pushViewController(DetailHomeViewController(), animated: true)
        }), to: view)

    }
}

