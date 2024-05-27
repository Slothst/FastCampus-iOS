//
//  PurchaseButton.swift
//  Cproject
//
//  Created by 최낙주 on 5/26/24.
//

import UIKit
 
final class PurchaseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.keyColorBlue.cgColor
        setTitleColor(UIColor.keyColorBlue, for: .normal)
        setTitle("구매하기", for: .normal)
    }
}
