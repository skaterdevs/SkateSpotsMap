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

    var searchResults: [SkateSpot] {
        if searchText.isEmpty {
            return skateSpotViewModel.skate_spots
        }

        else {
            return skateSpotViewModel.skate_spots.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    
    var body: some View {
        VStack {
            NavigationStack {
                HStack{
                    Spacer()
                    TextField("Search:", text: $searchText)
                        
                    Spacer()
                        NavigationLink(
                            destination: FilterView(inputKickout: filterViewModel.kickout, inputDistance: filterViewModel.maxDistance,
                                                    inputRating: filterViewModel.minAvgRating),
                            label:{
                                FilterButtonView()
                            }
                        )
                    Spacer()
                }
                .overlay(RoundedRectangle(cornerRadius: 3)
                .stroke(.gray, lineWidth: 1))
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, -4)

                List{
                    ForEach(filterViewModel.validSpots(searchText:searchText)) { result in
                        SearchRowView(skateSpot: result).frame(maxHeight:.infinity)
                    }
                    
                }.background(Color(UIColor.lightGray))
            }
        }
    }
}
