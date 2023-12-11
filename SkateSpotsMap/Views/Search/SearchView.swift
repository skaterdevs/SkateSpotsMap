//
//  SearchSpotsView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct SearchView: View {
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
        //TextField("Search: ", text:$searchText)
        ScrollView{
            VStack {
                NavigationView {
                    List{
                        ForEach (skateSpotViewModel.skate_spots) { skateSpot in
                            SearchRowView(skateSpot: SkateSpot.exampleTemp).frame(maxHeight:.infinity)
                            //Text(skateSpot.name)
                        }
                    }
                }
            }
        }
        
    }
}