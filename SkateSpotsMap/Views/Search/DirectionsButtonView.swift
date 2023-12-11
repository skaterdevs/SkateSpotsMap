//
//  DirectionsButtonView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct DirectionsButtonView: View {
    var skateSpot : SkateSpot
    var body: some View {
        VStack {


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
            Text("Directions").font(.caption).fontWeight(.semibold)
        }
    }
}


