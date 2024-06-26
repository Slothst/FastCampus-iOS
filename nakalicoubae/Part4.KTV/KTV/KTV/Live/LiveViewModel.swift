//
//  LiveViewModel.swift
//  KTV
//
//  Created by 최낙주 on 4/4/24.
//

import Foundation

enum LiveSortOption {
    case favorite
    case start
}

@MainActor class LiveViewModel {
    private(set) var items: [Live.Item]?
    private(set) var sortOption: LiveSortOption = .favorite
    var dataChanged: (([Live.Item]) -> Void)?
    
    func request(sort: LiveSortOption) {
        Task {
            do {
                let live = try await DataLoader.load(url: URLDefines.live, for: Live.self)
                let items: [Live.Item]
                if sort == .start {
                    items = live.list.reversed()
                } else {
                    items = live.list
                }
                self.items = items
                self.dataChanged?(items)
            } catch {
                print(String(describing: error.localizedDescription))
            }
        }
    }
}
