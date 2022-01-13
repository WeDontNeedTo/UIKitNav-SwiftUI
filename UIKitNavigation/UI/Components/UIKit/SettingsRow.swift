//
//  SettingsRow.swift
//  UIKitNavigation
//
//  Created by Danil on 13.01.2022.
//

import Foundation
import UIKit
import SnapKit

class SettingsRow: UITableViewCell {
    
    static let cellId = "SettingsRow"

    
    var icon: String?
    var rowTitle: String?
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.secondaryLabel.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var arrowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    lazy var rowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var rowLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    func configure(with icon: String, and title: String) {
        self.icon = icon
        self.rowTitle = title
        
        self.rowLabel.text = rowTitle
        self.rowIcon.image = .init(named: icon)?.withRenderingMode(.alwaysTemplate)
        self.rowIcon.tintColor = .mainColor
    }
    
    func createSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(arrowIcon)
        containerView.addSubview(rowLabel)
        containerView.addSubview(rowIcon)
        
        containerView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView).multipliedBy(0.95)
            make.height.equalTo(44)
        }
        
        arrowIcon.snp.makeConstraints { make in
            make.width.equalTo(27)
            make.height.equalTo(27)
            make.centerY.equalTo(containerView)
            make.trailing.equalTo(containerView).inset(11)
        }
        
        rowLabel.snp.makeConstraints { make in
            make.centerY.equalTo(containerView)
            make.leading.equalTo(containerView).inset(70)
        }
        
        rowIcon.snp.makeConstraints { make in
            make.width.equalTo(27)
            make.height.equalTo(27)
            make.centerY.equalTo(containerView)
            make.leading.equalTo(containerView).inset(26)
        }
    }
}
