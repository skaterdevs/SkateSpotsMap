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
        // Retrieving API key
        let apiData = Bundle.main.path(forResource: "contents", ofType: "txt")
        var apiKey = try String(contentsOfFile: apiData!)
        // Xcode adds a newline character to all .txt files
        // URL does not like strings with \n in them so it is removed
        apiKey.remove(at: apiKey.firstIndex(of: "\n")!)
        
        // Calling Google DistanceMatrix API
        let url = URL(string:
                      "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=\(dLat)%2C\(dLong)&mode=walking&origins=\(sLat)%2C\(sLong)&units=imperial&key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let distMatrix = try JSONDecoder().decode(DistanceMatrix.self, from: data)
        if distMatrix.error_message == nil {
            return distMatrix.rows[0].elements[0].distance?.text ?? "N/A"
        }
        return "N/A"
    }
    
    func findSkateSpot(_ id: String) -> SkateSpot? {
        if let skateSpot = skateSpotRepository.skate_spots.first(where: {$0.skate_spot_id == id}) {
            return skateSpot
        } else {
            return nil
        }
    }
}
