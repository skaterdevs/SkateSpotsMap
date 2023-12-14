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
    @StateObject var locationManager = LocationManager()
    @State var distance: String?
//    @State private var features : [String]


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
        //Will need to be separated into SpotRowView at a later point
        //TextField("Search: ", text:$searchText)
        
            VStack {
                NavigationStack {
                    HStack{
                        //ZStack{
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
                            
                        //}
                        Spacer()
                    }
                    .overlay(RoundedRectangle(cornerRadius: 3)
                        .stroke(.gray, lineWidth: 1))
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.bottom, -4)
                    

                    List{
                        EmptyView()
                        ForEach(filterViewModel.validSpots(searchText:searchText)) { result in
                            EmptyView()
                            SearchRowView(skateSpot: result).frame(maxHeight:.infinity)
                        }
//                        ForEach (searchResults) { skateSpot in
//                            switch searchText.isEmpty{
//                                case true:
//                                    if(filterViewModel.filterChange){
//                                        if(filterViewModel.validSpots().contains(skateSpot)){
//                                            SearchRowView(skateSpot: skateSpot).frame(maxHeight:.infinity)
//                                        }
//                                    }
//                                    else{
//                                        SearchRowView(skateSpot: skateSpot).frame(maxHeight:.infinity)
//                                    }
//                                case false:
//                                    if(filterViewModel.validSpots().contains(skateSpot)){
//                                        SearchRowView(skateSpot: skateSpot).frame(maxHeight:.infinity)
//                                    }
//                            }
////                            if(filterViewModel.validSpots().contains(skateSpot)){
////                                SearchRowView(skateSpot: skateSpot).frame(maxHeight:.infinity)
////                            }
//                            if(filterViewModel.filterChange){
//                                filterViewModel.filterChange.toggle()
//                            }
//                        }
                        
                    }.background(Color(UIColor.lightGray))
                }
            }
    }
    func containsTags(features : [String]) -> Bool{

        return false
    }
}
