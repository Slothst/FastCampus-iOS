//
//  MyPointCell.swift
//  TossBenefitTab
//
//  Created by 최낙주 on 3/19/24.
//

import UIKit

class MyPointCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    func configure(item: MyPoint) {
        imageView.image = UIImage(named: "ic_point")
        descriptionLabel.text = "내 포인트"
        pointLabel.text = "\(item.point) 원"
    }
}
