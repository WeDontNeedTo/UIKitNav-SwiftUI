//
//  ViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import UIKit
import SwiftUI
import GXInject

protocol HomeViewControllerDelegate: AnyObject {
    func didTapAlcoCard(with drink: AlcoDrink)
}

class HomeViewController: UIViewController {
    
    @Injected var viewModel: HomeViewModel

    weak var delegate: HomeViewControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "Home"
        addSubSwiftUIView(HomeView(viewModel: self.viewModel, delegate: delegate), to: view)
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}

