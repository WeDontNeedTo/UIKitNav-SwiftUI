//
//  DetailHomeViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import Foundation
import UIKit
import SnapKit

class DetailHomeViewController: UIViewController {
    
    var drink: AlcoDrink? {
        didSet {
            drinkImage.sd_setImage(with: URL(string: drink?.strDrinkThumb ?? ""))

            drinkTitle.text = drink?.strDrink
        }
    }
    
    lazy var drinkImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var drinkTitle: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var drinkSubtitle: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.text = "375ml Can  |  5%"
        label.textAlignment = .left
        return label
    }()
    
    lazy var tastingNotes: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Tasting Notes"
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
            
            let bar = UITabBarAppearance()
            bar.configureWithOpaqueBackground()
            tabBarController?.tabBar.scrollEdgeAppearance = bar
        }
        
        setupUI()
        // Do any additional setup after loading the view.
        //        addSubSwiftUIView(DetailHomeView(), to: view)
        
        view.backgroundColor = .white
    }
}

extension DetailHomeViewController {
    private func setupUI() {
        view.addSubview(drinkImage)
        view.addSubview(drinkTitle)
        view.addSubview(drinkSubtitle)
        view.addSubview(tastingNotes)

    
        drinkImage.snp.makeConstraints { make in
            make.top.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.35)
        }
        
        drinkTitle.snp.makeConstraints { make in
            make.top.equalTo(drinkImage.snp.bottom).offset(10)
            make.left.equalTo(self.view).offset(25)
            make.right.equalTo(self.view).offset(-25)
        }
        
        drinkSubtitle.snp.makeConstraints { make in
            make.top.equalTo(drinkTitle.snp.bottom).offset(5)
            make.left.equalTo(self.view).offset(25)
            make.right.equalTo(self.view).offset(-25)
        }
        
        tastingNotes.snp.makeConstraints { make in
            make.top.equalTo(drinkSubtitle.snp.bottom).offset(5)
            make.left.equalTo(self.view).offset(25)
            make.right.equalTo(self.view).offset(-25)
        }
    }
}

