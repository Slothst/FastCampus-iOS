//
//  BookmarkCell.swift
//  KTV
//
//  Created by 최낙주 on 4/2/24.
//

import UIKit

class BookmarkCell: UITableViewCell {
    
    static let identifier: String = "BookmarkCell"

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    private var imageTask: Task<Void, Never>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.thumbnailImageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.label.text = nil
        self.thumbnailImageView.image = nil
        self.imageTask?.cancel()
        self.imageTask = nil
    }
    
    func setData(_ data: Bookmark.Item) {
        self.label.text = data.channel
        self.imageTask = self.thumbnailImageView.loadImage(url: data.thumbnail)
    }
}
