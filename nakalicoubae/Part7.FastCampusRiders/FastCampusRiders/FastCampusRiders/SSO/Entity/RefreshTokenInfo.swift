//
//  RefreshTokenInfo.swift
//  FastCampusRiders
//
//  Created by 최낙주 on 6/2/24.
//

import Foundation

struct RefreshTokenInfo: Decodable {
    
    let accessToken: String
    let expirationTime: TimeInterval
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expirationTime = "access_token_expiration"
    }
}
