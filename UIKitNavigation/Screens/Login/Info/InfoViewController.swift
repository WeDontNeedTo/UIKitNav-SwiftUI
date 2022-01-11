//
//  InfoViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
        
    @Injected var loginVM: LoginViewModel

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        addSubSwiftUIView(InfoView(viewModel: loginVM), to: view)
    }
}

