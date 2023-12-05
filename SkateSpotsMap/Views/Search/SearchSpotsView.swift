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
//        VStack {
//            HStack{
//                FilterButtonView()
//                TextField("Search:", text: $searchText)
//
//    //                .overlay(
//    //                    Rectangle()
//    //                    .stroke(lineWidth: 1)
//    //                )
//
//            }
//
//            NavigationStack {
//                List{
//                    ForEach (searchResults) { skateSpot in
//                        NavigationLink(
//                            destination: SkateSpotDetailView(skateSpot: skateSpot),
//                            label: {
//                                //ADD KICKOUT
//                                SingleSpotView(skateSpot: skateSpot)
//                            }
//                        )
//                    }
//                }
//            }//.searchable(text: $searchText).refreshable{}
//        }//.padding(.top, -50)
        
        NavigationStack{
            HStack{
                NavigationLink(
                    destination: FilterView(),
                    label:{
                        FilterButtonView()
                    }
                    )
                TextField("Search:", text: $searchText)
                }
            List{
                ForEach (searchResults) { skateSpot in
                    NavigationLink(
                        destination: SkateSpotDetailView(skateSpot: skateSpot),
                        label: {
                            //ADD KICKOUT
                            SingleSpotView(skateSpot: skateSpot)
                        }
                    )
                }
            }
        }
        
    }
}
//#Preview {
//    SearchSpotsView()
//}
