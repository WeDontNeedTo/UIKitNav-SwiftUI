//
//  SettingsHeader.swift
//  UIKitNavigation
//
//  Created by Danil on 13.01.2022.
//

import Foundation
import UIKit
import SnapKit

class SettingsHeader: UIView {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "ProfileImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, "
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .label
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubviews() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.width.equalTo(self)
            make.height.equalTo(self.snp.width).multipliedBy(0.5)
            make.bottom.equalTo(self).inset(25)
        }
        
        stackView.addArrangedSubview(profileImage)
        stackView.addArrangedSubview(helloLabel)
        stackView.addArrangedSubview(usernameLabel)
    }
}
