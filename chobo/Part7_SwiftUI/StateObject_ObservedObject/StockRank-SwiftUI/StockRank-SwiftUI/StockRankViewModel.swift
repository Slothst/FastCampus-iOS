//
//  StockRankViewModel.swift
//  StockRank-SwiftUI
//
//  Created by 최낙주 on 3/18/24.
//

import Foundation

final class StockRankViewModel: ObservableObject {
    @Published var models: [StockModel] = StockModel.list
    
    var numOfFavorites: Int {
        let favoriteStocks = models.filter { $0.isFavorite }
        return favoriteStocks.count
    }
}
