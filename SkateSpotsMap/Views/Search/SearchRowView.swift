//
//  SearchRowView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchRowView: View {
    var skateSpot : SkateSpot
    //let frameWidth = UIScreen.main.bounds.width
    var body: some View {
        NavigationLink(
            destination: SkateSpotDetailView(skateSpot: skateSpot),
            label: {
                HStack(){
                    VStack(alignment: .leading) {
                        Text(skateSpot.name)
                            .fontWeight(.bold)
                            .font(.title3)
                        SearchRatingView(skateSpot:skateSpot).padding(.top, -10)
                        SearchTagsView(skateSpot: skateSpot)
                        SearchFeaturesView(skateSpot: skateSpot)
                    }
                    Spacer()
                    VStack {
                        Text("Directions").fontWeight(.semibold).font(.system(size:14))
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
                        }.buttonStyle(.plain)
                    }
                }
            }
        )
    }
}

//struct SearchRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchRowView(skateSpot : SkateSpotRepository().skate_spots[0])
//    }
//}
