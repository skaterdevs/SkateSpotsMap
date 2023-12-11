//
//  SearchDistanceView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchDistanceView: View {
    var skateSpot : SkateSpot
    @State var distance: String?
    @StateObject var locationManager = LocationManager()
    @ObservedObject var skateSpotViewModel = SkateSpotViewModel()
    var body: some View {
        HStack{
            //Text("Distance".uppercased()).fontWeight(.light)
            //Text(distance ?? "Unavailable").fontWeight(.bold)
            Image("destinationIcon").resizable().aspectRatio(contentMode: .fit).frame(height: 20).padding(.trailing, -5)
            if let unwrapped = distance{
                //Text(unwrapped + " miles away!").font(.subheadline)
                Text(unwrapped ).font(.subheadline)
            }
            else{
                Text("Unavailable").font(.subheadline)
            }
        }.task {
            do {
                let sLat = locationManager.userLatitude()
                let sLong = locationManager.userLongitude()
                let dLat = skateSpot.location.latitude
                let dLong = skateSpot.location.longitude
                distance = try await skateSpotViewModel.getDist(sLat: sLat, sLong: sLong, dLat: dLat, dLong: dLong)
            } catch {
                distance = nil
            }
        }
    }
}


