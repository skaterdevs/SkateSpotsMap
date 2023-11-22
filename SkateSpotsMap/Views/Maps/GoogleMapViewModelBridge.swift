//
//  GoogleMapViewModelBridge.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/9/23.
//

import Combine
import GoogleMaps
import SwiftUI

struct GoogleMapViewModelBridge: UIViewControllerRepresentable {
//    @ObservedObject var markerViewModel = MarkerViewModel()
    
    var markerViewModel: MarkerViewModel
    var goToSkateSpot: () -> ()
    
    func makeUIViewController(context: Context) -> GoogleMapViewModel {
        let uiViewModel = GoogleMapViewModel()
        uiViewModel.mapView.delegate = context.coordinator
        // Enable user location
        uiViewModel.mapView.isMyLocationEnabled = true
        // Allow users to recenter
        uiViewModel.mapView.settings.myLocationButton = true
        return uiViewModel
    }
    
    func updateUIViewController(_ uiViewModel: GoogleMapViewModel, context: Context) {
        // Default camera position to user location
        let userLat = uiViewModel.mapView.myLocation?.coordinate.latitude
        let userLong = uiViewModel.mapView.myLocation?.coordinate.longitude
        uiViewModel.mapView.camera = GMSCameraPosition.camera(withLatitude: userLat ?? 0,
                                                              longitude: userLong ?? 0,
                                                              zoom: 15)
        uiViewModel.mapView.clear()
        markerViewModel.skateSpotMarkers.forEach { marker in
            marker.map = uiViewModel.mapView
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }
    
    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var googleMapViewModelBridge: GoogleMapViewModelBridge
        
        init(_ googleMapViewModelBridge: GoogleMapViewModelBridge) {
            self.googleMapViewModelBridge = googleMapViewModelBridge
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            // Unpack SkateSpot object in the marker
            let skateSpot = marker.userData as! SkateSpot?
            self.googleMapViewModelBridge.goToSkateSpot()
            self.googleMapViewModelBridge.markerViewModel.selectedSkateSpot = skateSpot
            print("Tapped \(skateSpot!.name) with \(skateSpot?.reviews.count) reviews")
            return true
        }
    }
}
