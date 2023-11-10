//
//  LeaveReviewHeader.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 11/9/23.
//

import SwiftUI

struct LeaveReviewView: View {
    var skateSpot : SkateSpot
    var body: some View {
        NavigationLink(
            destination: NewReviewView(skateSpot:skateSpot, user: User.example),
            label:{
                Spacer()
                VStack{
                    Text("Leave a Review")
                    HStack{
                        ForEach(0..<5){_ in
                            Image(systemName: "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(width: 12)
                        }
                    }
                }
                Spacer()
            }
        ).padding([.top, .bottom], 20)
    }
}

//struct LeaveReviewHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaveReviewHeader()
//    }
//}
