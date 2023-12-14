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
            Image(systemName: "location.fill")
                .foregroundColor(Color(UIColor.darkGray))
                .frame(height: 20)
                .padding(.trailing, -4)
            
            Text("Distance:").font(.subheadline)
                .foregroundColor(Color(UIColor.darkGray))
                .fontWeight(.semibold)
                .padding(.trailing, -4)
            
            if let unwrapped = distance{
                //Text(unwrapped + " miles away!").font(.subheadline)
                Text(unwrapped ).font(.subheadline)
            }
            else{
                Text("Data Unavailable").font(.subheadline)
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


