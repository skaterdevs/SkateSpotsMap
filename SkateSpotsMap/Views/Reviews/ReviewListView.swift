//
//  ReviewListView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct ReviewListView: View {
    var skateSpot: SkateSpot
    var body: some View {
            VStack{
                ReviewListHeaderView(skateSpot: skateSpot)
                Divider()
                //Leave a review
                LeaveReviewView(skateSpot: skateSpot)
                Divider()
                //Reviews Stack
                //VStack{
                    Text("Reviews")
                        .font(.title)
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .padding([.leading, .bottom],20)
                    //List of rows of reviews
                    List{
                        ForEach([Review.example, Review.example2, Review.example3]){
                            review in
                                SingleReviewView(review:review)
                        }
                    }
                    
                //}

            Spacer()
            
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
  static var previews: some View {
    ReviewListView(skateSpot: SkateSpot.example)
  }
}

//#Preview {
//  ReviewListView(skateSpot: .example)
//}
