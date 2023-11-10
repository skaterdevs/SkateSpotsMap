//
//  SkateSpotOverviewView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/8/23.
//

import SwiftUI

struct SkateSpotOverviewView: View {
  var skateSpot: SkateSpot
  @State var distance: String?
  @StateObject var locationManager = LocationManager()
  @ObservedObject var skateSpotViewModel = SkateSpotViewModel()
  
  var body: some View {
    VStack {
      
      HStack {
        Spacer()
        VStack {
          Text("Distance".uppercased()).fontWeight(.light)
          Text(distance ?? "").fontWeight(.bold)
        }
        Spacer()
        VStack {
          Text("Rating".uppercased()).fontWeight(.light)
          Text("\(String(format: "%.2f", skateSpot.rating_avg))").fontWeight(.bold)
        }
        Spacer()
        VStack {
          Text("Kick-out Factor".uppercased()).fontWeight(.light)
          Text("\(skateSpot.overall_kickout)").fontWeight(.bold)
        }
        Spacer()
      }
      
      Divider().frame(height: 15)
      
      VStack {
        HStack {
          HStack(spacing: 20) {
            // TODO: make show skateSpot.photos
            ForEach(skateSpot.tags, id: \.self) { tag in
              Text(tag)
                .padding(10)
                .overlay(
                  RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 1)
                )
            }
          }
        }
      }
      
      Divider().frame(height: 15)
      
      // TODO: Features
      
      VStack {
        HStack(spacing: 20) {
          ForEach(skateSpot.features, id: \.self) { feature in
            Text(feature)
          }
        }
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

struct SkateSpotOverviewView_Previews: PreviewProvider {
  static var previews: some View {
    SkateSpotOverviewView(skateSpot: SkateSpot.example)
  }
}

//#Preview {
//  SkateSpotOverviewView(skateSpot: .example)
//}
