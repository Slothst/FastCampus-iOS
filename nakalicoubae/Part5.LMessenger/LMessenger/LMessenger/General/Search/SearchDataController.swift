//
//  SearchDataController.swift
//  LMessenger
//
//  Created by 최낙주 on 5/2/24.
//

import Foundation
import CoreData

class SearchDataController: ObservableObject {
    
    let persistantContainer = NSPersistentContainer(name: "Search")
    
    init() {
        persistantContainer.loadPersistentStores { description, error in
            if let error {
                print("Core data failed: ", error)
            }
        }
    }
}
