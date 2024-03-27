//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 최낙주 on 3/10/24.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
//        diffLabel.textColor = diffLabel.text!.hasPrefix("-") ? .systemBlue : .systemRed
        diffLabel.textColor = stock.diff > 0 ? .systemRed : .systemBlue
        diffLabel.text = "\(stock.diff)%"
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: price)) ?? ""
    }
}
