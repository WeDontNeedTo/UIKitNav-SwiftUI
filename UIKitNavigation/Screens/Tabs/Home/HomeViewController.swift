//
//  ViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubSwiftUIView(HomeView(viewModel: self.viewModel), to: view)
    }
}

