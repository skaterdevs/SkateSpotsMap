//
//  SkateSpotViewModel.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import Foundation
import SwiftUI

class SkateSpotViewModel: ObservableObject {
    private var skateSpotRepository = SkateSpotRepository()
    @Published var skateSpots: [SkateSpot]

    init() {
        self.skateSpots = skateSpotRepository.skate_spots
    }

    func add(skateSpot: SkateSpot) {
        skateSpotRepository.create(skateSpot)
    }
  
    func destroy(skateSpot: SkateSpot) {
        skateSpotRepository.delete(skateSpot)
    }
    
    func appleMapsRedirect(skateSpot: SkateSpot) {
        let lat: Double = skateSpot.location.latitude
        let long: Double = skateSpot.location.longitude
        let mapsURL = URL(string: "maps://?dirflg=w&saddr=&daddr=\(lat),\(long)")
        UIApplication.shared.open(mapsURL!,options: [:],
        completionHandler: nil)
    }
}
