//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryDateInputView: View {
    
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                DatePicker(
                    "Start Date",
                    selection: $vm.date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                
                Spacer()
                
                NavigationLink {
                    DiaryMoodInputView()
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
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false))
        DiaryDateInputView(vm: vm)
    }
}
