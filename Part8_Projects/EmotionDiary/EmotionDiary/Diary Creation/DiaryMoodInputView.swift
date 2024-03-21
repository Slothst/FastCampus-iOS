//
//  DiaryMoodInputView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryMoodInputView: View {
    
    @ObservedObject var vm: DiaryViewModel
    
    let moods: [Mood] = Mood.allCases
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(moods, id:\.self) { mood in
                    Button {
                        print("Mood Selected")
                        vm.mood = mood
                    } label: {
                        VStack {
                            Image(systemName: mood.imageName)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80)
                                .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
                                .padding()
                            Text(mood.name)
                                .foregroundStyle(.gray)
                        }
                        .frame(height: 180)
                        .background(mood == vm.mood ? .gray.opacity(0.4) : .clear)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            NavigationLink {
                DiaryTextInputView(vm: vm)
            } label: {
                Text("Next")
                    .frame(width: 200, height: 80)
                    .foregroundStyle(.white)
                    .background(.pink)
                    .clipShape(Capsule())
            }
        }
        
    }
}

struct DiaryMoodInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryMoodInputView(
            vm: DiaryViewModel(
                isPresented: .constant(false),
                diaries: .constant(MoodDiary.list)
            )
        )
    }
}
