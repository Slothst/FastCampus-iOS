//
//  FrameworkListViewModel.swift
//  AppleFramework
//
//  Created by 최낙주 on 3/15/24.
//

import Foundation
import Combine

final class FrameworkListViewModel {
    
    init(items: [AppleFramework], selectedItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectedItem)
    }
    
    // Data => Output
    let items: CurrentValueSubject<[AppleFramework], Never>
    let selectedItem: CurrentValueSubject<AppleFramework?, Never>
    
    // User Action => Input
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    
    func didSelect(at indexPath: IndexPath) {
        let item = items.value[indexPath.item]
        selectedItem.send(item)
    }
}
