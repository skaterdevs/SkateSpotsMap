//
//  UserSkateSpotsView.swift
//  SkateSpotsMap
//
//  Created by Daniel Johann Arriola on 12/10/23.
//

import SwiftUI

struct UserSkateSpotsView: View {
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var skateSpotVM = SkateSpotViewModel()
    @ObservedObject var repo = UserRepository()
    var body: some View {
        VStack {
            if let user = userVM.findUser(User.defaultUser) {
                List {
                    ForEach(user.spots.map {skateSpotVM.findSkateSpot($0)!}) { spotID in
                        Text(spotID.name)
                    }
                }
            } else {
                Text("No Skate Spots")
            }
        }
    }
}

struct UserSkateSpotsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSkateSpotsView()
    }
}
