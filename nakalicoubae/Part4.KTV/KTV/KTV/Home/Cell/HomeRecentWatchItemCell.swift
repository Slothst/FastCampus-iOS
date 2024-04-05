//
//  HomeRecentWatchItemCell.swift
//  KTV
//
//  Created by 최낙주 on 3/31/24.
//

import UIKit

class HomeRecentWatchItemCell: UICollectionViewCell {
    
    static let identifier: String = "HomeRecentWatchItemCell"
    static let size: CGSize = CGSize(width: 84, height: 148)

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var imageTask: Task<Void, Never>?
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYMMDD."
        return formatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.thumbnailImageView.layer.cornerRadius = 42
        self.thumbnailImageView.layer.borderWidth = 2
        self.thumbnailImageView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageTask?.cancel()
        self.imageTask = nil
        self.thumbnailImageView.image = nil
        self.titleLabel.text = nil
        self.subtitleLabel.text = nil
        self.dateLabel.text = nil
    }
    
    func setData(_ data: Home.Recent) {
        self.titleLabel.text = data.title
        self.subtitleLabel.text = data.channel
        self.dateLabel.text = Self.dateFormatter.string(
            from: .init(timeIntervalSince1970: data.timeStamp)
        )
        self.imageTask = self.thumbnailImageView.loadImage(url: data.imageUrl)
    }
}
