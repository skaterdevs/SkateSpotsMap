//
//  SearchSpotsView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct SearchSpotsView: View {
    @ObservedObject var skateSpotViewModel = SkateSpotViewModel()
    var searchResults : [SkateSpot] = []
    //@Published var test = SkateSpotViewModel().skateSpots
    @State private var searchText = ""
    
    var body: some View {
        //Text(String(skateSpotsList.skateSpots.count))
        //Will need to be separated into SpotRowView at a later point
        VStack {
            NavigationView {
                List{
                    Text(String(skateSpotViewModel.skateSpots.count))
                    //ForEach (skateSpotViewModel.skateSpots) { skateSpot in
                    ForEach (searchResults) { skateSpot in
                        NavigationLink(
                            //destination: SkateSpotDetailView(skateSpot: SkateSpot.example),
                            destination: SkateSpotDetailView(skateSpot: skateSpot),
                            label: {
                                HStack(){
                                    VStack(alignment: .leading) {
                                        Text(skateSpot.name)
                                            //Text(spot.name)
                                                .fontWeight(.bold)
                                                .font(.title3)
                                            HStack(spacing: 4){
                                                //var rating_string = String(format: "%.2f", skateSpot.rating_avg)
                                                var rating_string = String(format: "%.2f", skateSpot.rating_avg)
                                                Text(rating_string).multilineTextAlignment(.leading)
                                                    .font(.headline)
                                                    .fontWeight(.light)
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .scaledToFit()
                                                    .frame(width: 12)
                                                    .foregroundStyle(.yellow)
                                                //Text("(102)").multilineTextAlignment(.leading)
                                                Text(String((skateSpot.reviews).count)).multilineTextAlignment(.leading)
                                                    .font(.headline)
                                                    .fontWeight(.light)
                                            }
                                        HStack{
                                            Text("Tags:").font(.headline)
                                            //ForEach(skateSpot.tags, id: \.self){ tag in
                                            ForEach(skateSpot.tags, id: \.self){ tag in
                                                Text(tag).fontWeight(.light)
                                            }
                                        }
                                        HStack{
                                            Text("Features:").font(.headline)
                                            //ForEach(skateSpot.features, id: \.self){ feature in
                                            ForEach(skateSpot.features, id: \.self){ feature in
                                                Text(feature).fontWeight(.light)
                                            }
                                        }

                                    }

                                    VStack {
                                        Text("Distance").fontWeight(.semibold)
                                        //zstack potentially for button
                                        Button{
                                            var lat = skateSpot.location.latitude //replace with lat from skatespot geopoint
                                            var long = skateSpot.location.longitude //replace with long from skatespot geopoint
                                            let mapsURL = URL(string: "maps://?dirflg=w&saddr=&daddr=\(lat),\(long)")
                                            UIApplication.shared.open(mapsURL!,options: [:],completionHandler: nil)
                                        } label: {
                                            Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 40)
                                                .foregroundStyle(.green)
                                        }

                                    }
                                }
                            })
                    }
                }.navigationTitle("Skate Spots")//.frame(width:widthTest, height:heightTest)
            }.searchable(text: $searchText).refreshable
            {
                
            }
            
        }
        var searchResults: [SkateSpot] {
            if searchText.isEmpty {
                return skateSpotViewModel.skateSpots
            } else {
                return skateSpotViewModel.skateSpots.filter { $0.name.contains(searchText) }
            }
        }
    }
}
//#Preview {
//    SearchSpotsView()
//}
