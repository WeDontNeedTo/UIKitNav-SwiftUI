//
//  OnboardingViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation
import UIKit
import SwiftUI

class OnboardingViewController: UIViewController {
    let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubSwiftUIView(OnboardingView(viewModel: self.viewModel), to: view)
    }
}


