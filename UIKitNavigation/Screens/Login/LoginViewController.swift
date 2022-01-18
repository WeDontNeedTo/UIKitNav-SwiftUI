//
//  LoginViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import UIKit
import GXInject

protocol LoginViewControllerDelegate: AnyObject {
  func didEnterPhoneNumber()
}

class LoginViewController: UIViewController {
    
    @Injected private var loginVM: LoginViewModel
    weak var delegate: LoginViewControllerDelegate?
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .black
        addSubSwiftUIView(LoginView(delegate: self.delegate, viewModel: self.loginVM), to: view)
    }
}
