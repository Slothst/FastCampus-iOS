//
//  SettingViewModel.swift
//  LMessenger
//
//  Created by 최낙주 on 5/2/24.
//

import Foundation

class SettingViewModel: ObservableObject {
    
    @Published var sectionItems: [SectionItem] = []
    
    init() { 
        self.sectionItems = [
            .init(label: "모드설정", settings: AppearanceType.allCases.map { .init(item: $0) })
        ]
    }
}
