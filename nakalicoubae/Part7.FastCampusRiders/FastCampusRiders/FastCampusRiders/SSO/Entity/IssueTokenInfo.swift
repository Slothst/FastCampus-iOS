//
//  IssueTokenInfo.swift
//  FastCampusRiders
//
//  Created by 최낙주 on 6/2/24.
//

import Foundation

struct IssueTokenInfo: Decodable {
    
    let accessToken: String
    let expirationTime: TimeInterval
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expirationTime = "access_token_expiration"
        case refreshToken = "refresh_token"
    }
}
