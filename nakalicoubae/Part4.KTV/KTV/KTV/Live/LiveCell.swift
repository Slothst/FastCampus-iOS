//
//  LiveCell.swift
//  KTV
//
//  Created by 최낙주 on 4/4/24.
//

import UIKit

class LiveCell: UICollectionViewCell {
    
    static let height: CGFloat = 76
    static let identifier: String = "LiveCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    private var imageTask: Task<Void, Never>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.liveLabel.layer.cornerRadius = 5
        self.liveLabel.clipsToBounds = true
        self.imageView.layer.cornerRadius = 5
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.imageTask?.cancel()
        self.imageTask = nil
    }

    func setData(_ data: Live.Item) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.channel
        self.imageTask = self.imageView.loadImage(url: data.thumbnailUrl)
    }
}
