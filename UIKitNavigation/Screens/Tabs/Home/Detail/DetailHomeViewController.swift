    //
//  DetailHomeViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import Foundation
import UIKit

class DetailHomeViewController: UIViewController {
    
    var drink: AlcoDrink?
    
    var detailView = DetailView()
    
    override func loadView() {
        detailView.drink = drink
        view = detailView
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .white
    }
    
}


