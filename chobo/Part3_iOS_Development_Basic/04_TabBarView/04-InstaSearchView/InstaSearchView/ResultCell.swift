//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by 최낙주 on 3/11/24.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
