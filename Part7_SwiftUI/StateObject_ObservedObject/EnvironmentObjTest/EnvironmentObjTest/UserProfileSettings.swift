//
//  UserProfileSettings.swift
//  EnvironmentObjTest
//
//  Created by 최낙주 on 3/18/24.
//

import Foundation

final class UserProfileSettings: ObservableObject {
    
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func haveBirthdayParty() {
        age += 1
    }
}
