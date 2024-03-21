//
//  DiaryDetailsView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var diary: MoodDiary
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    Text(self.formattedDate(dateString: diary.date))
                        .font(.system(size: 30, weight: .bold))
                    
                    Image(systemName: diary.mood.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
                        .frame(height: 80)
                    Text(diary.text)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
            }
            
            HStack {
                Button {
                    print("Delete Button Tapped!")
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .padding()
                Spacer()
            }
        }
    }
}

extension DiaryDetailsView {
    private func formattedDate(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: dateString)
        
        formatter.dateFormat = "EEE, MMM d, yyyy"
        return formatter.string(from: date!)
    }
}

struct DiaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailsView(diary: MoodDiary.list.first!)
    }
}
