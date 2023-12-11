//
//  SearchReviewView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/11/23.
//

import SwiftUI

struct SearchReviewView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack(spacing: 0) {
            Text("\(String(format: "%.2f", skateSpot.rating_avg))")
                .font(.footnote)
//                .foregroundColor(Color(UIColor.darkGray))
                .foregroundColor(Color(UIColor.lightGray)).padding(.trailing, 3)
            GenerateStarView(rating: skateSpot.rating_avg)
            Text("(\(skateSpot.rating_sum))")
                .font(.footnote)
                .foregroundColor(Color(UIColor.lightGray))
            
            
        }
    }
}

