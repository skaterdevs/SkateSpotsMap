//
//  SingleSpotView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI

struct SingleSpotView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack{
            VStack{
                Text(skateSpot.name)
                //ReviewAvg + stars
                SearchRatingView(skateSpot: skateSpot)
                TagsAndFeaturesView(skateSpot: skateSpot)
                
                //Replace with images, will most likely need a VStack to avoid graphical issues
                
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
}

//struct SingleSpotView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleSpotView()
//    }
//}
