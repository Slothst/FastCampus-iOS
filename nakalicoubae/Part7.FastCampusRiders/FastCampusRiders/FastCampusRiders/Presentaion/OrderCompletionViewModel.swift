//
//  OrderCompletionViewModel.swift
//  FastCampusRiders
//
//  Created by 최낙주 on 6/2/24.
//

import Combine
import Foundation
import MBAkit

class OrderCompletionViewModel: ViewModelConfigurable {
    typealias VC = OrderCompletionViewController
    
    var outputSubject = PassthroughSubject<Result<VC.O, Error>, Never>()
    
    func handleMessage(_ inputMessage: VC.I) {
        switch inputMessage {
        case .completeOrder:
            self.outputSubject.send(.success(.completeOrder))
        }
    }
}
