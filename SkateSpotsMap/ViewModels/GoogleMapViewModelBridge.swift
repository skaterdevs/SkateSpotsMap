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
    @ObservedObject var markerViewModel = MarkerViewModel()
    
    func makeUIViewController(context: Context) -> GoogleMapViewModel {
        let uiViewModel = GoogleMapViewModel()
        uiViewModel.mapView.delegate = context.coordinator
        uiViewModel.mapView.isMyLocationEnabled = true
        uiViewModel.mapView.settings.myLocationButton = true
        return uiViewModel
    }
    
    func updateUIViewController(_ uiViewModel: GoogleMapViewModel, context: Context) {
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
            let skateSpot = marker.userData as! SkateSpot
            print("Tapped \(skateSpot.name)")
            let skateSpotDetailsView = UIHostingController(rootView: SkateSpotDetailView(skateSpot: skateSpot))
            return true
        }
    }
}
