//
//  PushObject.swift
//  LMessenger
//
//  Created by 최낙주 on 5/1/24.
//

import Foundation

struct PushObject: Encodable {
    var to: String
    var notification: NotificationObject
    
    struct NotificationObject: Encodable {
        var title: String
        var body: String
    }
}
