//
//  FrameworkListViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by 최낙주 on 3/19/24.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: AppleFramework?
}
