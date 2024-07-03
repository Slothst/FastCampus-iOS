//
//  OrderCompletionViewInteractor.swift
//  FastCampusRiders
//
//  Created by 최낙주 on 6/2/24.
//

import Combine
import MBAkit
import UIKit

class OrderCompletionViewInteractor: ViewInteractorConfigurable {
    
    typealias VC = OrderCompletionViewController
    
    private var photoManager: PhotoManager?
    private(set) var cancellables = Set<AnyCancellable>()
    
    func handleMessage(_ interactionMessage: VC.IM) {
        switch interactionMessage {
        case .presentCameraViewController(let imageView, let vc):
            let photoManager = PhotoManager()
            photoManager.photoSubject
                .receive(on: DispatchQueue.main)
                .sink { [weak self] result in
                    result.fold { image in
                        imageView.image = image
                    } failure: { error in
                        print(error.localizedDescription)
                    }
                    self?.photoManager = nil
                }.store(in: &cancellables)
            
            photoManager.presentImagePickerViewcontroller(
                with: .video,
                sourceType: .camera,
                allowEditing: false,
                on: vc
            )
            self.photoManager = photoManager
            
        case .dismissCompletionViewController(let vc):
            let presentVC = vc.presentingViewController
            vc.dismiss(animated: true) {
                let alertView = UIAlertController(
                    title: "주문 전달 완료",
                    message: nil,
                    preferredStyle: .alert
                )
                alertView.addAction(UIAlertAction(title: "확인", style: .default))
                presentVC?.present(alertView, animated: true)
            }
        }
    }
}
