//
//  ChatData.swift
//  LMessenger
//
//  Created by 최낙주 on 4/30/24.
//

import Foundation

struct ChatData: Hashable, Identifiable {
    var dateStr: String
    var chats: [Chat]
    var id: String { dateStr }
}
