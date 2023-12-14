//
//  UserSkateSpotRowView.swift
//  SkateSpotsMap
//
//  Created by Daniel on 12/14/23.
//

import SwiftUI

struct UserSkateSpotRowView: View {
    var skateSpot: SkateSpot
    var body: some View {
        NavigationLink(
            destination: SkateSpotDetailView(skateSpot: skateSpot),
            label: {
                Text(skateSpot.name)
                    .fontWeight(.bold)
                    .font(.body)
            })
    }
}

//struct UserSkateSpotRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserSkateSpotRowView()
//    }
//}
