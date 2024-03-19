//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by 최낙주 on 3/19/24.
//

import Foundation

final class MyPointViewModel {
    @Published var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
}
