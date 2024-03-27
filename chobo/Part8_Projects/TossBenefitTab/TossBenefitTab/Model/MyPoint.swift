//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by 최낙주 on 3/19/24.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
