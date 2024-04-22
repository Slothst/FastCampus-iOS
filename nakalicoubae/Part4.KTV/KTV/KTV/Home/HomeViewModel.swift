//
//  HomeViewModel.swift
//  KTV
//
//  Created by 최낙주 on 3/31/24.
//

import Foundation

@MainActor class HomeViewModel {
    
    private(set) var home: Home?
    let recommendViewModel: HomeRecommendViewModel = .init()
    var dataChanged: (() -> Void)?
    
    func requestData() {
        Task {
            do {
//                let home = try await DataLoader.load(url: URLDefines.home, for: Home.self)
                let home = try DataLoader.load(json: "home", for: Home.self)
                self.home = home
                self.recommendViewModel.recommends = home.recommends
                self.dataChanged?()
            } catch {
                print(String(describing: error))
            }
        }
    }
}
