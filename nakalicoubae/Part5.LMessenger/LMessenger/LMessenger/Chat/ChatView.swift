//
//  ChatView.swift
//  LMessenger
//
//  Created by 최낙주 on 4/28/24.
//

import SwiftUI
import PhotosUI

struct ChatView: View {
    @EnvironmentObject var navigationRouter: NavigationRouter
    @StateObject var viewModel: ChatViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                if viewModel.chatDataList.isEmpty {
                    Color.chatBg
                } else {
                    contentView
                }
            }
            .onChange(of: viewModel.chatDataList.last?.chats){ newValue in
                proxy.scrollTo(newValue?.last?.id, anchor: .bottom)
            }
        }
        .background(Color.chatBg)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
        .toolbarBackground(Color.chatBg, for: .navigationBar)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    navigationRouter.pop()
                } label: {
                    Image("back")
                }
                
                Text(viewModel.otherUser?.name ?? "대화방이름")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.bkText)
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                Image("search_chat")
                Image("bookmark") 
                Image("settings")
            }
        }
        .keyboardToolbar(height: 50) {
            HStack(spacing: 13) {
                Button {
                } label: {
                    Image("other_add")
                }
                PhotosPicker(
                    selection: $viewModel.imageSelection,
                             matching: .images
                ) {
                    Image("image_add")
                }
                Button {
                } label: {
                    Image("photo_camera")
                }

                TextField("", text: $viewModel.message)
                    .font(.system(size: 16))
                    .foregroundStyle(Color.bkText)
                    .focused($isFocused)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 13)
                    .background(Color.greyCool)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Button {
                    viewModel.send(action: .addChat(viewModel.message))
                    isFocused = false
                } label: {
                    Image("send")
                }
                .disabled(viewModel.message.isEmpty)
            }
            .padding(.horizontal, 27)
        }
        .onAppear {
            viewModel.send(action: .load)
        }
    }
    
    var contentView: some View {
        ForEach(viewModel.chatDataList) { chatData in
            Section {
                ForEach(chatData.chats) { chat in
                    if let message = chat.message {
                        ChatItemView(
                            message: message,
                            direction: viewModel.getDirection(id: chat.userId),
                            date: chat.date
                        )
                        .id(chat.chatId)
                    } else if let photoURL = chat.photoURL {
                        ChatImageItemView(
                            urlString: photoURL,
                            direction: viewModel.getDirection(id: chat.userId)
                        )
                        .id(chat.chatId)
                    }
                }
            } header: {
                headerView(dateStr: chatData.dateStr)
            }
        }
    }
    
    func headerView(dateStr: String) -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.clear)
                .frame(width: 76, height: 20)
                .background(Color.chatNotice)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            Text(dateStr)
                .font(.system(size: 10))
                .foregroundStyle(Color.bgWh)
        }
    }
}

#Preview {
    NavigationStack {
        ChatView(
            viewModel: .init(
                container: DIContainer(services: StubService()),
                chatRoomId: "chatRoom1_id",
                myUserId: "user1_id",
                otherUserId: "user2_id"
            )
        )
    }
}
