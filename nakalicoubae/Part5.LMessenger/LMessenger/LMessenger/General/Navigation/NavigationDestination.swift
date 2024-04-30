//
//  NavigationDestination.swift
//  LMessenger
//
//  Created by 최낙주 on 4/28/24.
//

import Foundation

enum NavigationDestination: Hashable {
    case chat(chatRoomId: String, myUserId: String, otherUserId: String)
    case search
}
