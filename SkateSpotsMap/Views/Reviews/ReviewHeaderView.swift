//
//  ReviewHeader.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 11/9/23.
//

import SwiftUI

struct ReviewHeaderView: View {
    var skateSpot: SkateSpot
    var body: some View {
        VStack{
            Text(skateSpot.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            OverviewReviewPartialView(skateSpot: skateSpot, isOverview: false)
        }
        HStack{
            Text(String(skateSpot.rating_avg))
                .fontWeight(.semibold)
//                    .multilineTextAlignment(.center)
            
            //Stars for average rating
            ForEach(0..<Int(skateSpot.rating_avg)){_ in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
                
            }
            ForEach(0..<5-Int(skateSpot.rating_avg)){_ in
                Image(systemName: "star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 15)
            }
            
            Text("(\(skateSpot.reviews.count))")
                .fontWeight(.regular)
        }.padding(.vertical, 20)
    }
}

struct ReviewHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        ReviewHeaderView(skateSpot: SkateSpot.example)
    }
}
