//
//  ChatListViewModel.swift
//  LMessenger
//
//  Created by 최낙주 on 4/28/24.
//

import Foundation
import Combine

class ChatListViewModel: ObservableObject {
    
    enum Action {
        case load
    }
    
    @Published var chatRooms: [ChatRoom] = []
    
    let userId: String
    
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func send(action: Action) {
        switch action {
        case .load:
            container.services.chatRoomService.loadChatRoom(myUserId: userId)
                .sink { completion in
                    
                } receiveValue: { [weak self] chatRooms in
                    self?.chatRooms = chatRooms
                }.store(in: &subscriptions)
        }
    }
}
