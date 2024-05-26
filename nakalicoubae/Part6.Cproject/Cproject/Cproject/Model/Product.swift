//
//  Product.swift
//  Cproject
//
//  Created by 최낙주 on 5/26/24.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}
