//
//  EnterCodeViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import UIKit

protocol EnterCodeViewControllerDelegate: AnyObject {
  func didEnterCode()
}

class EnterCodeViewController: UIViewController {
    
    weak var delegate: EnterCodeViewControllerDelegate?
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        addSubSwiftUIView(EnterCodeView(delegate: self.delegate, viewModel: viewModel), to: view)
    }
}

