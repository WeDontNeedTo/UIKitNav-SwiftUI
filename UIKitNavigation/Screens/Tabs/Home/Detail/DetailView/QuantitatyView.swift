//
//  QuantitatyView.swift
//  UIKitNavigation
//
//  Created by Danil on 10.01.2022.
//

import Foundation
import UIKit

class QuantitatyView: UIView {
    
    var qty: Int
        
    init(qty: Int) {
        self.qty = qty
        super.init(frame: .zero)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var hStackQty: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 4
        return stack
    }()
    
    lazy var removeQtyButton: UIButton = {
        let button = UIButton(title: "-")
        button.addAction(UIAction(handler: { [weak self] action in
            guard let self = self else { return }
            guard self.qty > 1 else { return }
            self.qty -= 1
            self.qtyCounter.text = self.qty.description
        }), for: .touchUpInside)
        
        return button
    }()
    
    lazy var addQtyButton: UIButton = {
        let button = UIButton(title: "+")
        button.addAction(UIAction(handler: { [weak self] action in
            guard let self = self else { return }
            self.qty += 1
            self.qtyCounter.text = self.qty.description
        }), for: .touchUpInside)
        
        return button
    }()
    
    lazy var qtyCounter: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "1"
        return label
    }()
    
    func createSubViews() {
        addSubview(hStackQty)
        
        hStackQty.addArrangedSubview(removeQtyButton)
        hStackQty.addArrangedSubview(qtyCounter)
        hStackQty.addArrangedSubview(addQtyButton)
    
    }
}
