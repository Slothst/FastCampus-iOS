//
//  HomeViewModel.swift
//  LMessenger
//
//  Created by 최낙주 on 4/25/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var myUser: User?
    @Published var users: [User] = [.stub1, .stub2]
}
