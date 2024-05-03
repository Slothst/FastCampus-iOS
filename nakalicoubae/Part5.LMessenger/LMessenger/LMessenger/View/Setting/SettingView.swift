//
//  SettingView.swift
//  LMessenger
//
//  Created by 최낙주 on 5/2/24.
//

import SwiftUI

struct SettingView: View {
    @AppStorage(AppStorageType.Appearance) var appearance: Int = UserDefaults.standard.integer(forKey: AppStorageType.Appearance)
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var container: DIContainer
    @StateObject var viewModel: SettingViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sectionItems) { section in
                    Section {
                        ForEach(section.settings) { setting in
                            Button {
                                if let a = setting.item as? AppearanceType {
                                    container.appearanceController.changeAppearance(a)
                                    appearance = a.rawValue
                                }
                            } label: {
                                Text(setting.item.label)
                                    .foregroundStyle(Color.bkText)
                            }

                        }
                    } header: {
                        Text(section.label)
                    }
                }
            }
            .navigationTitle("설정")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image("close_search")
                }
            }
        }
        .preferredColorScheme(container.appearanceController.appearance.colorScheme)
    }
}

#Preview {
    SettingView(viewModel: .init())
}
