//
//  FavoriteItemTableViewCell.swift
//  Cproject
//
//  Created by 최낙주 on 5/26/24.
//

import UIKit
import Kingfisher

struct FavoriteItemTableViewCellViewModel: Hashable {
    let imageUrl: String
    let productName: String
    var productPrice: String
}

class FavoriteItemTableViewCell: UITableViewCell {
    static let reusableId: String = "FavoriteItemTableViewCell"
    
    @IBOutlet weak var productItemImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productPurchaseButton: PurchaseButton!
    
    func setViewModel(_ viewModel: FavoriteItemTableViewCellViewModel) {
        productItemImageView.kf.setImage(with: URL(string: viewModel.imageUrl))
        productTitleLabel.text = viewModel.productName
        productPriceLabel.text = viewModel.productPrice
    }
}
