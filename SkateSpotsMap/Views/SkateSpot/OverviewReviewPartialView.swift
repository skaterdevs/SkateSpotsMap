//
//  OverviewReviewPartialView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/10/23.
//

import SwiftUI

struct OverviewReviewPartialView: View {
    var skateSpot: SkateSpot?
    @State var isOverview: Bool
    
    var body: some View {
        // overview and reviews
        Divider().padding(5)
        HStack {
          Spacer()
        NavigationLink(
        destination: SkateSpotDetailView(skateSpot: skateSpot!),
        label: {
          Text("Overview")
        }).disabled(isOverview)

        Spacer()
        NavigationLink(
        destination: SkateSpotReviewsView(skateSpot: skateSpot!),
        label: {
          Text("Reviews")
        }).disabled(!isOverview)

          Spacer()
        }
        Divider().padding(5)
    }
}
