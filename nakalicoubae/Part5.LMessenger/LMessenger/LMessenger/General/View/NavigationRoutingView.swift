//
//  NavigationRoutingView.swift
//  LMessenger
//
//  Created by 최낙주 on 4/28/24.
//

import SwiftUI

struct NavigationRoutingView: View {
    @EnvironmentObject var container: DIContainer
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case let .chat(chatRoomId, myUserId, otherUserId):
            ChatView(
                viewModel: .init(
                    container: container,
                    chatRoomId: chatRoomId,
                    myUserId: myUserId,
                    otherUserId: otherUserId
                )
            )
        case let .search(userId):
            SearchView(viewModel: .init(container: container, userId: userId))
        }
    }
}
