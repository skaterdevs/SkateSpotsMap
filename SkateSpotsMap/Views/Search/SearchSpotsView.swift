//
//  SearchSpotsView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct SearchSpotsView: View {
    @ObservedObject var skateSpotViewModel = SkateSpotRepository()
    @State private var searchText = ""
    var searchResults: [SkateSpot] {
        if searchText.isEmpty {
            return skateSpotViewModel.skate_spots
        } else {
            return skateSpotViewModel.skate_spots.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    var body: some View {
        //Will need to be separated into SpotRowView at a later point
        VStack {
            NavigationView {
                List{
                    ForEach (searchResults) { skateSpot in
                        SkateSpotRowView(skateSpot: skateSpot)
                    }
                }
            }.searchable(text: $searchText).refreshable{}
        }.padding(.top, -50)
    }
}
//#Preview {
//    SearchSpotsView()
//}
