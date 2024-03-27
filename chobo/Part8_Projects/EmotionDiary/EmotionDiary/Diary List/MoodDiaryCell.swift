//
//  MoodDiaryCell.swift
//  EmotionDiary
//
//  Created by 최낙주 on 3/21/24.
//

import SwiftUI

struct MoodDiaryCell: View {
    
    var diary: MoodDiary
    
    var body: some View {
        Image(systemName: diary.mood.imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
    }
}

#Preview {
    MoodDiaryCell(diary: MoodDiary.list[0])
}
