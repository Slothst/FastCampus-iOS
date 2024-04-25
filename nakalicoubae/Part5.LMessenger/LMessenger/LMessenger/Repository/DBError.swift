//
//  DBError.swift
//  LMessenger
//
//  Created by 최낙주 on 4/25/24.
//

import Foundation

enum DBError: Error {
    case error(Error)
    case emptyValue
    case invalidatedType
}
