//
//  ReviewListView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct SkateSpotReviewsView: View {
    var skateSpot: SkateSpot
    var body: some View {
        VStack{
            ReviewHeaderView(skateSpot: skateSpot)
            
            Divider()
            
            //Leave a review
            LeaveReviewView(skateSpot: skateSpot)
            
            Divider()
            
            //List of rows of reviews
            List{
                ForEach(skateSpot.reviews){ review in
                    ReviewRowView(review:review)
                }
            }
            Spacer()
        }
    }
}

struct SkateSpotReviewsView_Previews: PreviewProvider {
  static var previews: some View {
      SkateSpotReviewsView(skateSpot: SkateSpot.example)
  }
}
