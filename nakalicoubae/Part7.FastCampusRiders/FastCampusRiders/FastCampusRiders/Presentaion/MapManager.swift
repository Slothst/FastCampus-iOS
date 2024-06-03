//
//  MapManager.swift
//  FastCampusRiders
//
//  Created by 최낙주 on 5/31/24.
//

import CoreLocation
import Foundation

protocol DirectionsAvailable {
    
    static var canOpen: Bool { get }
    var appName: String { get }
    func openAppToGetDirections(with coordinates: CLLocationCoordinate2D, name: String?)
}

enum MapManager: CaseIterable {
    
    case apple, google, kakao, naver
    
    static func getMapApps() -> [DirectionsAvailable] {
        
        var mapAppList: [DirectionsAvailable] = []
        
        for target in MapManager.allCases {
            switch target {
            case .apple:
                guard MapAppleDirections.canOpen else { continue }
                mapAppList.append(MapAppleDirections())
            case .google:
                guard MapGoogleDirections.canOpen else { continue }
                mapAppList.append(MapGoogleDirections())
            case .kakao:
                guard MapKakaoDirections.canOpen else { continue }
                mapAppList.append(MapKakaoDirections())
            case .naver:
                guard MapNaverDirections.canOpen else { continue }
                mapAppList.append(MapNaverDirections())
            }
        }
        
        return mapAppList
    }
}
