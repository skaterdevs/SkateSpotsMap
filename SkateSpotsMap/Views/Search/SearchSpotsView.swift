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
//            NavigationView {
//                List{
//                    ForEach (searchResults) { skateSpot in
//                        NavigationLink(
//                            destination: SkateSpotDetailView(skateSpot: skateSpot),
//                            label: {
//                                HStack(){
//                                    VStack(alignment: .leading) {
//                                        Text(skateSpot.name)
//                                            .fontWeight(.bold)
//                                            .font(.title3)
//                                        HStack(spacing: 4){
//                                            var rating_string = String(format: "%.2f", skateSpot.rating_avg)
//                                            Text(rating_string).multilineTextAlignment(.leading)
//                                                .font(.system(size:10))
//                                                .fontWeight(.light)
//                                            Image(systemName: "star.fill")
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                                .scaledToFit()
//                                                .frame(width: 12)
//                                                .foregroundStyle(.yellow)
//                                            //Text("(102)").multilineTextAlignment(.leading)
//                                            Text("(" + String((skateSpot.reviews).count) + ")").multilineTextAlignment(.leading)
//                                                .font(.system(size:10))
//                                                .fontWeight(.light)
//                                        }
//                                        HStack{
//                                            Text("Tags:").font(.system(size:14)).multilineTextAlignment(.leading)
//                                            //ForEach(skateSpot.tags, id: \.self){ tag in
//                                            ForEach(skateSpot.tags, id: \.self){ tag in
//                                                Text(tag).fontWeight(.light).font(.system(size:10)).padding(.top, 2)
//                                            }
//                                        }
//                                        HStack{
//                                            Text("Features:").font(.system(size:14)).multilineTextAlignment(.leading)
//                                            ForEach(skateSpot.features, id: \.self){ feature in
//                                                Text(feature).fontWeight(.light).font(.system(size:10)).padding(.top, 2)
//                                            }
//                                        }
//                                    }
//                                    Spacer()
//                                    VStack {
//                                        Text("Directions").fontWeight(.semibold).font(.system(size:14))
//                                        //zstack potentially for button
//                                        Button{
//                                            var lat = skateSpot.location.latitude //replace with lat from skatespot geopoint
//                                            var long = skateSpot.location.longitude //replace with long from skatespot geopoint
//                                            let mapsURL = URL(string: "maps://?dirflg=w&saddr=&daddr=\(lat),\(long)")
//                                            UIApplication.shared.open(mapsURL!,options: [:],completionHandler: nil)
//                                        } label: {
//                                            Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                                .frame(width: 40)
//                                                .foregroundStyle(.green)
//                                        }.buttonStyle(.plain)
//                                    }
//                                }
//                            }
//                        )
//                    }
//                }
//            }.searchable(text: $searchText).refreshable{}
        }.padding(.top, -50)
    }
}
//#Preview {
//    SearchSpotsView()
//}
