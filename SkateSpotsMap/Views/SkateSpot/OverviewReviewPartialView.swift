//
//  OverviewReviewPartialView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/10/23.
//

import SwiftUI

struct OverviewReviewPartialView: View {
    var skateSpot: SkateSpot
    @State var selectedTab = "Overview"
    
    var body: some View {
        Picker("", selection: $selectedTab) {
            Text("Overview").tag("Overview")
            Text("Reviews").tag("Reviews")
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        
        TabView(selection: $selectedTab) {
            SkateSpotOverviewView(skateSpot: skateSpot)
                .tag("Overview")
            SkateSpotReviewsView(skateSpot: skateSpot)
                .tag("Reviews")
        }
    }
}

//#Preview {
//    OverviewReviewPartialView(skateSpot: SkateSpot.example, isOverview: false)
//}
