//
//  Bookmark.swift
//  KTV
//
//  Created by 최낙주 on 4/2/24.
//

import Foundation

struct Bookmark: Decodable {
    let channels: [Item]
}

extension Bookmark {
    struct Item: Decodable {
        let channel: String
        let channelId: Int
        let thumbnail: URL
    }
}
