//
//  AppearanceController.swift
//  LMessenger
//
//  Created by 최낙주 on 5/2/24.
//

import Foundation
import Combine

class AppearanceController: ObservableObject {
    
    @Published var appearance: AppearanceType
    
    init(_ appearanceValue: Int) {
        self.appearance = AppearanceType(rawValue: appearanceValue) ?? .automatic
    }
    
    func changeAppearance(_ willBeAppearance: AppearanceType) {
        appearance = willBeAppearance
    }
}
