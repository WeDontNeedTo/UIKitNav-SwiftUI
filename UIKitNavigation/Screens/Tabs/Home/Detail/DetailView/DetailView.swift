//
//  DetailView.swift
//  UIKitNavigation
//
//  Created by Danil on 07.01.2022.
//

import Foundation
import UIKit
import SnapKit

public extension Formatter {
    static let ruCurrencyWithFractionDigits: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 2
        formatter.locale = .init(identifier: "ru_RU")
        formatter.numberStyle = .currency
        return formatter
    }()
}

class DetailView: UIView {
    // MARK: - proporties
        
    var drink: AlcoDrink? {
        didSet {
            drinkImage.sd_setImage(with: URL(string: drink?.strDrinkThumb ?? "")) { image, error, cacheType, _ in
                self.setImageView(with: image)
            }
            drinkTitle.text = drink?.strDrink
        }
    }
    
    // MARK: - init
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    
    lazy var drinkImage: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy var drinkTitle: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var drinkSubtitle: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.text = "375ml Can  |  5%"
        label.textAlignment = .left
        return label
    }()
    
    lazy var tastingNotes: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Tasting Notes"
        label.textAlignment = .left
        return label
    }()
    
    lazy var drinkInfo: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.text = """
        \(drink?.strDrink ?? "Beer"), a premium mild beer crafted with the finest European Barley for a rich and smooth taste. Brewed specially for the Indian palate with a refreshing and elegant taste, Carlsberg Smooth offers a unique product and a new experience to our consumers.
        """
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton(title: "Add to Cart", titleColor: .white)
        return button
    }()
    
    lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var qtyTitle: UILabel = {
        let label = UILabel()
        label.textColor = .mainColor
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Qty"
        return label
    }()
    
    lazy var priceTitle: UILabel = {
        let label = UILabel()
        label.textColor = .mainColor
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Price"
        return label
    }()
    
    lazy var qtyCounter: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "1"
        return label
    }()
    
    lazy var priceCounter: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = Formatter.ruCurrencyWithFractionDigits.string(for: Double.random(in: 100.50..<600.30))
        return label
    }()
    
    lazy var hStackCounter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    var quantitatyView = QuantitatyView(qty: 1)
}

extension DetailView {
    
    // MARK: - set image view
    private func setImageView(with image: UIImage?) {
        drinkImage.contentMode = .scaleAspectFill
        drinkImage.clipsToBounds = true
    }
    
    // MARK: - setup UI
    
    func createSubViews() {
        addSubview(drinkImage)
        addSubview(drinkTitle)
        addSubview(drinkSubtitle)
        addSubview(tastingNotes)
        addSubview(drinkInfo)
        addSubview(addToCartButton)
        
        addSubview(hStack)
        hStack.addArrangedSubview(qtyTitle)
        hStack.addArrangedSubview(priceTitle)
        
        addSubview(quantitatyView)
    
        addSubview(hStackCounter)
        hStackCounter.addArrangedSubview(quantitatyView)
        hStackCounter.addArrangedSubview(priceCounter)
        
        
        drinkImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.35)
        }
        
        drinkTitle.snp.makeConstraints { make in
            make.top.equalTo(drinkImage.snp.bottom).offset(10)
            make.left.right.equalTo(self).inset(25)
        }
        
        drinkSubtitle.snp.makeConstraints { make in
            make.top.equalTo(drinkTitle.snp.bottom).offset(5)
            make.left.right.equalTo(self).inset(25)
        }
        
        qtyTitle.snp.makeConstraints { make in
            make.width.equalTo(self).multipliedBy(0.3)
        }
        
        hStack.snp.makeConstraints { make in
            make.top.equalTo(drinkSubtitle.snp.bottom).offset(22)
            make.left.equalTo(self).inset(25)
            make.right.equalTo(self).inset(35)
        }
        
        quantitatyView.snp.makeConstraints { make in
            make.top.equalTo(hStack.snp.bottom).offset(8)
            make.left.equalTo(self).inset(25)
            make.width.equalTo(self).multipliedBy(0.3)
        }
        
        quantitatyView.hStackQty.snp.makeConstraints { make in
            make.top.equalTo(hStack.snp.bottom).offset(8)
            make.left.equalTo(self).inset(25)
            make.width.equalTo(self).multipliedBy(0.3)
        }
        
        hStackCounter.snp.makeConstraints { make in
            make.top.equalTo(hStack.snp.bottom).offset(8)
            make.left.equalTo(self).inset(25)
            make.right.equalTo(self).inset(35)
        }
        
        tastingNotes.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(hStackCounter.snp.bottom).offset(22)
            make.left.right.equalTo(self).inset(25)
        }
        
        drinkInfo.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(tastingNotes.snp.bottom).offset(10)
            make.left.right.equalTo(self).inset(25)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.bottom.lessThanOrEqualTo(self.safeAreaLayoutGuide).offset(-10)
            make.left.right.equalTo(self).inset(25)
            make.height.equalTo(self.snp.width).multipliedBy(0.16)
        }
    }
}


