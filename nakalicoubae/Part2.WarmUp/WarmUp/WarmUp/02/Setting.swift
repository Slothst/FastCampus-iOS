//
//  Setting.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct SettingInfo: Hashable {
    let title: String
    let systemName: String
    let backgroundColor: Color
    let foregroundColor: Color
}

struct Setting: View {
    
    let data: [[SettingInfo]] = [
        [SettingInfo(title: "스크린 타임", systemName: "hourglass", backgroundColor: .indigo, foregroundColor: .white)],
        [SettingInfo(title: "일반", systemName: "gear", backgroundColor: .gray, foregroundColor: .white),
        SettingInfo(title: "손쉬운 사용", systemName: "accessibility", backgroundColor: .blue, foregroundColor: .white),
        SettingInfo(title: "개인정보 보호 및 보안", systemName: "hand.raised.fill", backgroundColor: .blue, foregroundColor: .white)],
        [SettingInfo(title: "암호", systemName: "key", backgroundColor: .gray, foregroundColor: .white)]
    ]
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(data, id: \.self) { section in
                    Section {
                        ForEach(section, id: \.self) { item in
                            Label {
                                Text(item.title)
                            } icon: {
                                Image(systemName: item.systemName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(.all, 5)
                                    .background(item.backgroundColor)
                                    .foregroundStyle(item.foregroundColor)
                                    .clipShape(.rect(cornerRadius: 6))
                            }

                        }
                    }
                }
            }.navigationTitle("설정")
        }
    }
}

#Preview {
    Setting()
}
