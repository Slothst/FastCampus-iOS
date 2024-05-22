//
//  HomeBannerCollectionViewCell.swift
//  Cproject
//
//  Created by 최낙주 on 5/22/24.
//

import UIKit

class HomeBannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
