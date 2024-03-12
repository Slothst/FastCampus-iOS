//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 최낙주 on 3/12/24.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
