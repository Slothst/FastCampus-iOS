//
//  VideoListItem.swift
//  KTV
//
//  Created by 최낙주 on 4/2/24.
//

import Foundation

struct VideoListItem: Decodable {
    let imageUrl: URL
    let title: String
    let playtime: Double
    let channel: String
    let videoId: Int
}
