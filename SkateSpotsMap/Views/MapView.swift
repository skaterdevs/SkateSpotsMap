//
//  MapView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI
import GoogleMaps

struct MapView: View {
    @State var selectedSkateSpot: SkateSpot?
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                GoogleMapViewModelBridge(goToSkateSpot: { (skateSpot) in
                    self.selectedSkateSpot = skateSpot
                    self.isActive = true
                })
                NavigationLink(destination: SkateSpotDetailView(skateSpot: selectedSkateSpot), isActive: $isActive) { EmptyView() }
            }
        }
    }
}

//#Preview {
//    MapView()
//}
