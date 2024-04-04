//
//  Live.swift
//  KTV
//
//  Created by 최낙주 on 4/4/24.
//

import Foundation

struct Live: Decodable {
    let list: [Item]
}

extension Live {
    struct Item: Decodable {
        let videoId: Int
        let thumbnailUrl: URL
        let title: String
        let channel: String
    }
}
