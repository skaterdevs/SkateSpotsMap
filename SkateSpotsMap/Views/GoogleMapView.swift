//
//  GoogleMapView.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/2/23.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 40.44, longitude: -79.94, zoom: 10.0)
        let mapView = GMSMapView(frame: .zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
}
