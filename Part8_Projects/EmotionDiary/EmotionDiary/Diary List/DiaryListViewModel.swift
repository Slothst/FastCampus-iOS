//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by 최낙주 on 3/21/24.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
    
    @Published var list: [MoodDiary] = MoodDiary.list
    @Published var dic: [String: [MoodDiary]] = [:]
    
    init() {
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        return dic.keys.sorted { $0 < $1 }
    }
}
