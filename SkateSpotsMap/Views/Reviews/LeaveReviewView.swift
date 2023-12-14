//
//  LeaveReviewHeader.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 11/9/23.
//

import SwiftUI

struct LeaveReviewView: View {
    var skateSpot : SkateSpot
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var repo = UserRepository()
    var body: some View {
        let user = userVM.findUser(User.defaultUser) ?? User.example
        NavigationLink(
            destination: NewReviewView(skateSpot:skateSpot, user: user),
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
                                .frame(width: 15)
                        }
                    }
                }
                Spacer()
            }
        ).padding([.top, .bottom], 20)
    }
}

struct LeaveReviewView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveReviewView(skateSpot: SkateSpot.example)
    }
}
