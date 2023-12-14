//
//  SearchRatingView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchRatingView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack(){

            let rating_string = String(format: "%.2f", skateSpot.rating_avg)
            Text(rating_string)
                .multilineTextAlignment(.leading)
                .font(.system(size:10))
                .fontWeight(.light)
                .padding(.top, 1)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 12)
                .foregroundStyle(.yellow)
            Text("(" + String((skateSpot.reviews).count) + ")")
                .multilineTextAlignment(.leading)
                .font(.system(size:10))
                .fontWeight(.light)
        }
    }
}

//struct SearchRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchRatingView()
//    }
//}
