//
//  OrderDetailMapViewCell.swift
//  FastCampusRiders
//
//  Created by Moonbeom KWON on 2023/09/21.
//

import Combine
import MapKit
import UIKit

class OrderDetailMapViewCell: UITableViewCell {
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var navigationButton: UIButton!
    @IBOutlet private weak var routeButton: UIButton!
    
    static let cellIdentifier = "OrderDetailMapViewCell"
    private var routeOverlay : MKOverlay?

    private var cancellables = Set<AnyCancellable>()
    private lazy var locationManager = {
        let locationManager = LocationManager()
        locationManager.locationSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                result.fold(success: { locationData in
                    guard let self = self else { return }
                    self.mapView.setCamera(MKMapCamera(lookingAtCenter: locationData.location.coordinate,
                                                       fromEyeCoordinate: locationData.location.coordinate,
                                                       eyeAltitude: 10_000), animated: true)
                }, failure: { error in
                    print(error.localizedDescription)
                })
            }.store(in: &self.cancellables)
        
        self.mapView.showsUserLocation = true
        return locationManager
    }()
}

extension OrderDetailMapViewCell {
    func bindNavigationAction(_ action: @escaping () -> Void) {
        self.navigationButton.addAction(action)
    }
    
    func bindRouteAction(_ action: @escaping () -> Void) {
        self.routeButton.addAction(action)
    }
    
    @IBAction private func touchCurrentLocationButton() {
        self.locationManager.updateCurrentLocation()
    }
}

extension OrderDetailMapViewCell: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
        let renderer = MKGradientPolylineRenderer(overlay: overlay)
        
        renderer.setColors([
            UIColor(red: 0.02, green: 0.91, blue: 0.05, alpha: 1.0),
            UIColor(red: 1.0, green: 0.48, blue: 0.0, alpha: 1.0),
            UIColor(red: 1.0, green: 0.91, blue: 0.0, alpha: 1.0)
        ], locations: [])
        renderer.lineCap = .round
        renderer.lineWidth = 3.0
        
        return renderer
    }
}

extension OrderDetailMapViewCell {
    func drawRoute(routeData: [CLLocation]) {
        if routeData.count == 0 {
            print("No Coordinates to draw")
            return
        }
        
        let coordinates = routeData.map(\.coordinate)
        
        if let exOverlay = self.routeOverlay {
            self.mapView.removeOverlay(exOverlay)
        }
        DispatchQueue.main.async {
            let routeOverlay = MKPolyline(coordinates: coordinates, count: coordinates.count)
            self.mapView.addOverlay(routeOverlay)
            self.mapView.setVisibleMapRect(
                routeOverlay.boundingMapRect,
                edgePadding: .zero,
                animated: true
            )
        }
    }
}
