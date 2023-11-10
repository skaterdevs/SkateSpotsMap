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
        self.view = mapView
    }
}
