//
//  PushNotificationProvider.swift
//  LMessenger
//
//  Created by 최낙주 on 5/1/24.
//

import Foundation
import Combine

protocol PushNotificationProviderType {
    func sendPushNotification(object: PushObject) -> AnyPublisher<Bool, Never>
}

class PushNotificationProvider: PushNotificationProviderType {
    
    private let serverURL: URL = URL(string: "https://fcm.googleapis.com/fcm/send")!
    private let serverKey = "AAAAyY8MxFU:APA91bGndTCyNuza_1sQu3ArPSQUmluRXDA3aFQTuaIuaM0OgcDZxDtVNgoWqIGDVzAS-C2-H2KPgNRAxZKbUM7Xu7ueO183_qR0-7Bo7sHeOIYuIald9KYWvQ1FHPruuHilSfsdYnV5"

    func sendPushNotification(object: PushObject) -> AnyPublisher<Bool, Never> {
        var request = URLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=\(serverKey)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(object)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { _ in true }
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }
}
