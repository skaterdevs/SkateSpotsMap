//
//  ReviewRowView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 11/9/23.
//

import SwiftUI

struct ReviewRowView: View {
    var review : Review
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text(review.reviewer.username)
                Text("•")
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
            HStack(alignment: .center){
                Text(review.comment ?? "")
                    .multilineTextAlignment(.center)
            }
        }.frame(maxWidth: .infinity)
    }
}

struct ReviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewRowView(review: Review.example)
    }
}
