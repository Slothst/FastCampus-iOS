//
//  MapAppleDirections.swift
//  FastCampusRiders
//
//  Created by 최낙주 on 5/31/24.
//

import CoreLocation
import MapKit
import UIKit

class MapAppleDirections: DirectionsAvailable {
    static var canOpen: Bool {
        if let mapURL = URL(string: "maps://") {
            return UIApplication.shared.canOpenURL(mapURL)
        } else {
            return false
        }
    }
    
    var appName: String {
        return "Apple"
    }
    
    func openAppToGetDirections(with coordinates: CLLocationCoordinate2D, name: String?) {
        let regionDistance: CLLocationDistance = 10_000
        let regionSpan = MKCoordinateRegion(
            center: coordinates,
            latitudinalMeters: regionDistance,
            longitudinalMeters: regionDistance
        )
        
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: options)
    }
}
