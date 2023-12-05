//
//  SearchRatingView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI

struct SearchRatingView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack(spacing: 4){
            var rating_string = String(format: "%.2f", skateSpot.rating_avg)
            Text(rating_string).multilineTextAlignment(.leading)
                .font(.system(size:10))
                .fontWeight(.light)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 12)
                .foregroundStyle(.yellow)
            //Text("(102)").multilineTextAlignment(.leading)
            Text("(" + String((skateSpot.reviews).count) + ")").multilineTextAlignment(.leading)
                .font(.system(size:10))
                .fontWeight(.light)
        }
        VStack(alignment: .leading) {
            Text(skateSpot.name)
                .fontWeight(.bold)
                .font(.title3)
        }
    }
}

//struct SearchRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchRatingView()
//    }
//}
