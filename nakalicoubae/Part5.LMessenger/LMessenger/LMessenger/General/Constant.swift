//
//  Constant.swift
//  LMessenger
//
//  Created by 최낙주 on 4/25/24.
//

import Foundation

typealias DBKey = Constant.DBKey
typealias AppStorageType = Constant.AppStorage

enum Constant { }

extension Constant {
    struct DBKey {
        static let Users = "Users"
        static let ChatRooms = "ChatRooms"
        static let Chats = "Chats"
    }
}

extension Constant {
    struct AppStorage {
        static let Appearance = "AppStorage_Appearance"
    }
}
