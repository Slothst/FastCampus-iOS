//
//  HomeModalDestination.swift
//  LMessenger
//
//  Created by 최낙주 on 4/25/24.
//

import Foundation

enum HomeModalDestination: Hashable, Identifiable {
    case myProfile
    case otherProfile(String)
    
    var id: Int {
        hashValue
    }
}
