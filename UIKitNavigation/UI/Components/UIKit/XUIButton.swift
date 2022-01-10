//
//  XUIButton.swift
//  UIKitNavigation
//
//  Created by Danil on 07.01.2022.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(title: String, titleColor: UIColor = .white, backgroundColor: UIColor = .mainColor, cornerRadius: CGFloat = 10) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor

        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)

    }
    
    convenience init(title: String) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.mainColor.cgColor

    }
}
