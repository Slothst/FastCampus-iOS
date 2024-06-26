//
//  ChatListView.swift
//  LMessenger
//
//  Created by 최낙주 on 4/25/24.
//

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject var container: DIContainer
    @StateObject var viewModel: ChatListViewModel
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destinations) {
            ScrollView {
                NavigationLink(value: NavigationDestination.search(userId: viewModel.userId)) {
                    SearchButton()
                }
                .padding(.top, 14)
                .padding(.bottom, 14)
                
                ForEach(viewModel.chatRooms, id: \.self) { chatRoom in
                    ChatRoomCell(chatRoom: chatRoom, userId: viewModel.userId)
                }
            }
            .navigationTitle("대화")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NavigationDestination.self) {
                NavigationRoutingView(destination: $0)
            }
            .onAppear {
                viewModel.send(action: .load)
            }
        }
    }
}

fileprivate struct ChatRoomCell: View {
    let chatRoom: ChatRoom
    let userId: String
    
    var body: some View {
        NavigationLink(
            value: NavigationDestination.chat(
            chatRoomId: chatRoom.chatRoomId,
            myUserId: userId, otherUserId:
                chatRoom.otherUserId
            )
        ) {
            HStack(spacing: 8) {
                Image("person")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 3) {
                    Text(chatRoom.otherUserName)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color.bkText)
                    if let lastMessage = chatRoom.lastMessage {
                        Text(lastMessage)
                            .font(.system(size: 12))
                            .foregroundStyle(Color.greyDeep)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 17)
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        ChatListView(viewModel: .init(container: Self.container, userId: "user1_id"))
            .environmentObject(Self.container)
    }
}
