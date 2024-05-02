//
//  SettingItem.swift
//  LMessenger
//
//  Created by 최낙주 on 5/2/24.
//

import Foundation

protocol SettingItemable {
    var label: String { get }
}

struct SectionItem: Identifiable {
    let id = UUID()
    let label: String
    let settings: [SettingItem]
}

struct SettingItem: Identifiable {
    let id = UUID()
    let item: SettingItemable
}
