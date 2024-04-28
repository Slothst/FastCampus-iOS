//
//  UploadSourceType.swift
//  LMessenger
//
//  Created by 최낙주 on 4/28/24.
//

import Foundation

enum UploadSourceType {
    case chat(chatRoomId: String)
    case profile(userId: String)
    
    var path: String {
        switch self {
        case let .chat(chatRoomId):
            return "\(DBKey.Chats)/\(chatRoomId)"
        case let .profile(userId):
            return "\(DBKey.Users)/\(userId)"
        }
    }
}
