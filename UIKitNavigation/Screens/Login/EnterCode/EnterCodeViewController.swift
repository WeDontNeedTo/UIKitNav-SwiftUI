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
    @Injected var loginVM: LoginViewModel
    weak var delegate: EnterCodeViewControllerDelegate?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        addSubSwiftUIView(EnterCodeView(delegate: self.delegate, viewModel: loginVM), to: view)
    }
}

