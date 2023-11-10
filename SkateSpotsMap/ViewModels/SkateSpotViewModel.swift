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
    
    func getDist(sLat: Double, sLong: Double, dLat: Double, dLong: Double) async throws -> String {
        let apiKey = ProcessInfo.processInfo.environment["MAPS_API_KEY"]
        let url = URL(string:
                      "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=\(dLat)%2C\(dLong)&mode=walking&origins=\(sLat)%2C\(sLong)&units=imperial&key=\(apiKey!)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let distMatrix = try JSONDecoder().decode(DistanceMatrix.self, from: data)
        if distMatrix.error_message == nil {
            return distMatrix.rows[0].elements[0].distance?.text ?? "N/A"
        }
        return "N/A"
    }
}
