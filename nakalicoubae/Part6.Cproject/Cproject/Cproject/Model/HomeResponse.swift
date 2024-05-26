//
//  HomeResponse.swift
//  Cproject
//
//  Created by 최낙주 on 5/23/24.
//

import Foundation

struct HomeResponse: Decodable {
    let banners: [Banner]
    let horizontalProducts: [Product]
    let verticalProducts: [Product]
    let themes: [Banner]
}

struct Banner: Decodable {
    let id: Int
    let imageUrl: String
}

