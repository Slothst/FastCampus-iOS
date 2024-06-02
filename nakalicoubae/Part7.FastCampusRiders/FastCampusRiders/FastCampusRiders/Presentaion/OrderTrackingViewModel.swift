//
//  OrderTrackingViewModel.swift
//  FastCampusRiders
//
//  Created by 최낙주 on 6/2/24.
//

import Combine
import Foundation
import MBAkit

class OrderTrackingViewModel: ViewModelConfigurable {
    typealias VC = OrderTrackingViewController
    
    private(set) var outputSubject = PassthroughSubject<Result<VC.O, Error>, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    private lazy var locationManager = {
        let locationManager = LocationManager()
        locationManager.locationSubject
            .receive(on: DispatchQueue.main)
            .sink { result in
                result.fold { locationData in
                    self.outputSubject.send(.success(.update(locationData: locationData)))
                } failure: { error in
                    self.outputSubject.send(.failure(error))
                }
            }.store(in: &cancellables)
        return locationManager
    }()
    
    func handleMessage(_ inputMessage: VC.I) {
        switch inputMessage {
        case .requestLocationData:
            self.locationManager.updateCurrentLocation(withHeading: true)
        }
    }
}
