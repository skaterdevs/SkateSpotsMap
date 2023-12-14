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
                    
                    HStack {
                        Spacer()
                        VStack {
                            Text("Distance".uppercased()).fontWeight(.light)
                            Text(distance ?? "Unavailable").fontWeight(.bold)
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
                        if(skateSpot.tags.count > 0) {
                            HStack {
                                LazyVGrid(columns: getNumTagColumns()) {
                                    ForEach(skateSpot.tags, id: \.self) { tag in
                                        Text(tag)
                                    }
                                }
                            }
                            Divider().frame(height: 15)
                        }
                    }
                    
                    
                    
                    // TODO: Features
                    
                    VStack {
                        if(skateSpot.features.count > 0) {
                            HStack {
                                LazyVGrid(columns: getNumFeatureColumns()) {
                                    ForEach(skateSpot.features, id: \.self) { feature in
                                        Text(feature)
                                    }
                                }
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
    }
    
    func getNumTagColumns() -> [GridItem] {
        if(skateSpot.features.count == 0) { return []}
        if(skateSpot.tags.count < 3) {
            var tagresult = [GridItem]()
            for _ in 1...skateSpot.tags.count {
                tagresult.append(GridItem(.flexible()))
            }
            return tagresult
        }
        return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }
    
    func getNumFeatureColumns() -> [GridItem] {
        if(skateSpot.features.count == 0) { return []}
        if(skateSpot.features.count < 3) {
            var featresult = [GridItem]()
            for _ in 1...skateSpot.features.count {
                featresult.append(GridItem(.flexible()))
            }
            return featresult
        }
        return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }
}

struct SkateSpotOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        SkateSpotOverviewView(skateSpot: SkateSpot.example2)
    }
}

//#Preview {
//  SkateSpotOverviewView(skateSpot: .example)
//}
