//
//  GoogleMapViewModel.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/9/23.
//

import UIKit
import GoogleMaps

class GoogleMapViewModel: UIViewController {
    let mapView = GMSMapView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "GoogleMapStyle", withExtension: "json") {
              mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
              NSLog("Unable to find GoogleMapStyle.json")
            }
          } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        self.view = mapView
    }
}
