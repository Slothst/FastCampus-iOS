//
//  ItemInfoDetails.swift
//  CarrotHomeTab
//
//  Created by 최낙주 on 3/20/24.
//

import Foundation

struct ItemInfoDetails: Codable {
    var user: User
    var item: ItemInfo
    var details: ItemExtraInfo
}

struct User: Codable {
    let name: String
    let thumbnail: String
    let location: String
    let temperature: Int
}

extension User {
    static let mock = User(
        name: "아랑",
        thumbnail: "https://source.unsplash.com/150x150/?person",
        location: "분당구 판교동",
        temperature: 46
    )
}

struct ItemExtraInfo: Codable {
    let itemThumbnails: [String]
    let description: String
}

extension ItemExtraInfo {
    static let mock = ItemExtraInfo(
        itemThumbnails: ["https://source.unsplash.com/400x400/?macbook"],
        description: "쿠팡에서 직접 매입해 판매하는 애플 정품입니다.\n 22년 2월 제조입니다.\n 판교동 직거래"
    )
}
