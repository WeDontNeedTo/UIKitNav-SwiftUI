//
//  OnboardingViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import Foundation
import UIKit
import SwiftUI
import GXInject

class OnboardingViewController: UIViewController {
    @Injected var viewModel: OnboardingViewModel
    
    init() {
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


