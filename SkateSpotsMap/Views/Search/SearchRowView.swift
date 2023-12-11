//
//  SearchRowView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchRowView: View {
    var skateSpot : SkateSpot
    //let frameWidth = UIScreen.main.bounds.width
    var body: some View {
        NavigationLink(
            destination: SkateSpotDetailView(skateSpot: skateSpot),
            label: {
                HStack(){
                    VStack(alignment: .leading) {
                        Text(skateSpot.name)
                            .fontWeight(.bold)
                            .font(.title3)
                            .padding(.bottom, -3)
                        
                        SearchReviewView(skateSpot: skateSpot).padding(.bottom, 1.5)
                        
                        SearchKickoutView(skateSpot : skateSpot, levelColor : .black).padding(.bottom, 0.5)
                        
                        SearchDistanceView(skateSpot : skateSpot)
                    }
                    Spacer()
                    DirectionsButtonView(skateSpot: skateSpot)
                }
            }
        )
    }
}

//struct SearchRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchRowView(skateSpot : SkateSpotRepository().skate_spots[0])
//    }
//}
