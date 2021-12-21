//
//  DetailHomeViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import Foundation
import UIKit

class DetailHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubSwiftUIView(DetailHomeView(), to: view)
    }


}

