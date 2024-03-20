//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by 최낙주 on 3/20/24.
//

import Foundation
import Combine

final class DetailViewModel {
    let network: NetworkService
    let itemInfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    var subscriptions = Set<AnyCancellable>()
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    func fetch() {
        
        // simulate network like behavior
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
            self.itemInfoDetails = ItemInfoDetails()
        }
        
//        let resource: Resource<ItemInfoDetails> = Resource(
//            base: "",
//            path: "",
//            params: [:],
//            header: [:]
//        )
//        network.load(resource)
//            .receive(on: RunLoop.main)
//            .sink { completion in
//                switch completion {
//                case .failure(let error):
//                    print("--> error: \(error)")
//                case .finished:
//                    print("--> finished")
//                }
//            } receiveValue: { details in
//                self.itemInfoDetails = details
//            }.store(in: &subscriptions)

    }
}
