//
//  ItemInfoCell.swift
//  CarrotHomeTab
//
//  Created by 최낙주 on 3/20/24.
//

import UIKit

class ItemInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numOfChatLabel: UILabel!
    @IBOutlet weak var numOfLikeLabel: UILabel!
    
    func configure(item: ItemInfo) {
//        thumbnail.image = item.thumbnailURL
        titleLabel.text = item.title
        descriptionLabel.text = item.location
        priceLabel.text = "\(item.price) 원"
        numOfChatLabel.text = "\(item.numOfChats)"
        numOfLikeLabel.text = "\(item.numOfLikes)"
        
    }
}
