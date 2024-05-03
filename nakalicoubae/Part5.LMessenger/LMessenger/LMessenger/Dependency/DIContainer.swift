//
//  DIContainer.swift
//  LMessenger
//
//  Created by 최낙주 on 4/23/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    var searchDataController: DataControllable
    var navigationRouter: NavigationRoutable & ObservableObjectSettable
    var appearanceController: AppearanceControllable & ObservableObjectSettable
    
    init(
        services: ServiceType,
        searchDataController: DataControllable = SearchDataController(),
        navigationRouter: NavigationRoutable & ObservableObjectSettable = NavigationRouter(),
        appearanceController: AppearanceControllable & ObservableObjectSettable = AppearanceController()
    ) {
        self.services = services
        self.searchDataController = searchDataController
        self.navigationRouter = navigationRouter
        self.appearanceController = appearanceController
         
        self.navigationRouter.setObjectWillChange(objectWillChange)
        self.appearanceController.setObjectWillChange(objectWillChange)
    }
}

extension DIContainer {
    static var stub: DIContainer {
        .init(services: StubService())
    }
}
