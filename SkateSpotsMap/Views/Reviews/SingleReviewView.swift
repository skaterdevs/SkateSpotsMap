//
//  SingleReviewView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 11/9/23.
//

import SwiftUI

struct SingleReviewView: View {
    var review : Review
    var body: some View {
        VStack{
            Text(review.reviewer.username).multilineTextAlignment(.leading)
            HStack{
                ForEach(0..<review.rating){_ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                    
                }
                ForEach(0..<5-review.rating){_ in
                    Image(systemName: "star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 10)
                }
            }
            var comment = review.comment ?? ""
            if comment != ""{
                Text(comment)
            }
            
        }
    }
}

//struct SingleReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleReviewView()
//    }
//}
