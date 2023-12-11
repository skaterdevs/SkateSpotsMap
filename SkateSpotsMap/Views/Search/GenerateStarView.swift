//
//  GenerateStarView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/11/23.
//

import SwiftUI

struct GenerateStarView: View {
    var rating : Float
    var body: some View {
        ForEach(0..<Int(rating), id: \.self) {_ in
            Image(systemName:"star.fill")
                .foregroundColor(.yellow)
                .font(.caption)
                //.imageScale(.small)
        }
        //Float(Int(skateSpot.rating_avg)) < skateSpot.rating_avg

        switch rating.truncatingRemainder(dividingBy: 1) >= 0.5 {

            case true:
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(.yellow)
                    .font(.caption)
                if rating != 4{
                    ForEach(Int(rating)+1..<5, id: \.self) {_ in
                        Image(systemName:"star.fill")
                            .foregroundColor(Color(UIColor.lightGray))
                            .font(.caption)
                    }
                }
            case false:
                ForEach((Int(rating)) ..< 5, id: \.self) {_ in
                    Image(systemName:"star.fill")
                        .foregroundColor(Color(UIColor.lightGray))
                        .font(.caption)
                
            }
        }
    }
}


