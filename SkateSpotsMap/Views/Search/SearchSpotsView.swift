//
//  SearchSpotsView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct SearchSpotsView: View {
    
    var searchResults : [String] = [""]
    @EnvironmentObject var skateSpotsList : SkateSpotViewModel
    //@Published var test = SkateSpotViewModel().skateSpots
    @State private var searchText = ""
    
    var body: some View {
        //Text(String(skateSpotsList.skateSpots.count))
        //Will need to be separated into SpotRowView at a later point
        VStack {
            NavigationView {
                List{
                    ForEach (skateSpotsList.skateSpots) { spot in
                        SkateSpotRowView(skateSpot: spot)
                    }
                }.navigationTitle("Skate Spots")//.frame(width:widthTest, height:heightTest)
            }.searchable(text: $searchText).refreshable{}
        }
        var searchResults: [SkateSpot] {
            if searchText.isEmpty {
                return skateSpotsList.skateSpots
            } else {
                return skateSpotsList.skateSpots.filter { $0.name.contains(searchText) }
            }
        }
    }
}
//#Preview {
//    SearchSpotsView()
//}
