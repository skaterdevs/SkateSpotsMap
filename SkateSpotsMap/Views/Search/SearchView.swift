//
//  SearchSpotsView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var skateSpotViewModel = SkateSpotRepository()
    @EnvironmentObject var filterViewModel : FilterViewModel
    @State private var searchText = ""
//    @State private var features : [String]


    var searchResults: [SkateSpot] {
        if searchText.isEmpty {
            return skateSpotViewModel.skate_spots
        } else {
            
            return skateSpotViewModel.skate_spots.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    
    var body: some View {
        //Will need to be separated into SpotRowView at a later point
        //TextField("Search: ", text:$searchText)
            VStack {
                NavigationStack {
                    HStack{
                        //ZStack{
                            TextField("Search:", text: $searchText).textFieldStyle(.roundedBorder)
                            NavigationLink(
                                destination: FilterView(inputKickout: filterViewModel.kickout, inputDistance: filterViewModel.maxDistance,
                                                        inputRating: filterViewModel.minAvgRating),
                                label:{
                                    FilterButtonView().frame(alignment : .trailing)
                                }
                            )
                            
                        //}
                        
                    }.padding(.top, 10)
                    List{
//                        ForEach (searchResults) { skateSpot in
//                            if(filterViewModel.validSpots().contains(skateSpot)){
//                                SearchRowView(skateSpot: skateSpot).frame(maxHeight:.infinity)
//                            }
//
//                            //Text(skateSpot.name)
//                        }
                        ForEach (filterViewModel.validSpots()) { skateSpot in
                            SearchRowView(skateSpot: skateSpot).frame(maxHeight:.infinity)
                        }
                    }
                }
            }
    }
    func containsTags(features : [String]) -> Bool{

        return false
    }
}
