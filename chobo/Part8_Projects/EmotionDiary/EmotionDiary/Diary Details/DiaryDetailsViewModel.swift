//
//  DiaryDetailsViewModel.swift
//  EmotionDiary
//
//  Created by 최낙주 on 3/21/24.
//

import Foundation
import SwiftUI

final class DiaryDetailsViewModel: ObservableObject {
    
    @Published var diaries: Binding<[MoodDiary]>
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    
    init(diaries: Binding<[MoodDiary]>, diary: MoodDiary) {
        self.diaries = diaries
        self.diary = diary
    }
    
    func delete() {
        diaries.wrappedValue = diaries.wrappedValue.filter { $0.id != diary.id }
    }
}
