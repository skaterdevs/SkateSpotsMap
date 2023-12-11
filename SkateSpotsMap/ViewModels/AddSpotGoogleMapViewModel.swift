//
//  AddSpotGoogleMapViewModel.swift
//  SkateSpotsMap
//
//  Created by Jason Perez on 11/10/23.
//

import Foundation
import GoogleMaps
import SwiftUI

struct AddSpotGoogleMapViewModel: UIViewControllerRepresentable {
    @Binding var selectedMarker: GMSMarker?
    var userCoords: CLLocationCoordinate2D?
    
    func makeUIViewController(context: Context) -> GoogleMapViewModel {
        let uiViewModel = GoogleMapViewModel()
        uiViewModel.mapView.delegate = context.coordinator
        // Enable user location
        uiViewModel.mapView.isMyLocationEnabled = true
        // Allow users to recenter
        uiViewModel.mapView.settings.myLocationButton = true
        // Default camera position to user location
        uiViewModel.mapView.camera = GMSCameraPosition.camera(withLatitude: userCoords?.latitude ?? 0,
                                                              longitude: userCoords?.longitude ?? 0,
                                                              zoom: 15)
        return uiViewModel
    }
    
    func updateUIViewController(_ uiViewModel: GoogleMapViewModel, context: Context) {
        // Default camera position to user location
        uiViewModel.mapView.camera = GMSCameraPosition.camera(withLatitude: userCoords?.latitude ?? 0,
                                                              longitude: userCoords?.longitude ?? 0,
                                                              zoom: 15)
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }
    
    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var addSpotGoogleMapViewModel: AddSpotGoogleMapViewModel
        
        init(_ addSpotGoogleMapViewModel: AddSpotGoogleMapViewModel) {
            self.addSpotGoogleMapViewModel = addSpotGoogleMapViewModel
        }
        
        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            print("Current Marker: ", self.addSpotGoogleMapViewModel.selectedMarker)
            guard let selectedMarker = self.addSpotGoogleMapViewModel.selectedMarker else {
                // Create new marker
                let marker = GMSMarker(position: coordinate)
                marker.map = mapView
                marker.isDraggable = true
                self.addSpotGoogleMapViewModel.selectedMarker = marker
                print("After assignment: " ,self.addSpotGoogleMapViewModel.selectedMarker)
                return
            }
        }
    }
}
