//
//  DIContainer.swift
//  LMessenger
//
//  Created by 최낙주 on 4/23/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}
