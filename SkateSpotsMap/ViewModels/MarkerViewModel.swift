//
//  MarkerViewModel.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/9/23.
//

import Foundation
import Combine
import GoogleMaps

class MarkerViewModel: ObservableObject {
    @Published var skateSpotRepository = SkateSpotRepository()
    @Published var skateSpotMarkers: [GMSMarker] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        skateSpotRepository.$skate_spots.map {skateSpots in
            skateSpots.map {skateSpot in
                let coordinate = CLLocationCoordinate2D(latitude: skateSpot.location.latitude,                                      longitude: skateSpot.location.longitude)
                let marker = GMSMarker(position: coordinate)
                marker.title = skateSpot.name
                marker.userData = skateSpot
                print("Name: \(skateSpot.name), Reviews: \(skateSpot.reviews.count)")
                return marker
            }
        }
        .assign(to: \.skateSpotMarkers, on: self)
        .store(in: &cancellables)
    }
}
