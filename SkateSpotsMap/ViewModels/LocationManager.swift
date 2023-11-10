//
//  LocationManager.swift
//  SkateSpotsMap
//
//  Created by Daniel on 11/9/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func userLatitude() -> Double {
        return Double(locationManager.location?.coordinate.latitude ?? 0)
    }
    
    func userLongitude() -> Double {
        return Double(locationManager.location?.coordinate.longitude ?? 0)
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }

        DispatchQueue.main.async {
            self.location = location
        }
    }
}
