//
//  Chat.swift
//  LMessenger
//
//  Created by 최낙주 on 4/30/24.
//

import Foundation

struct Chat: Hashable, Identifiable {
    var chatId: String
    var userId: String
    var message: String?
    var photoURL: String?
    var date: Date
    var id: String { chatId }
}
