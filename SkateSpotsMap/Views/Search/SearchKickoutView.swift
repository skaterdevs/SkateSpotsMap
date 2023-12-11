//
//  KickoutDistanceView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchKickoutView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack{
            Text("Kickout Rating:").font(.subheadline)
            switch skateSpot.overall_kickout{
                case Kickout.high.rawValue:
                    Text(skateSpot.overall_kickout)
                    .foregroundColor(.red)
                    .font(.subheadline)
                    //.fontWeight(.semibold)
                    .padding(.leading, -4)
                
                case Kickout.medium.rawValue:
                    Text(skateSpot.overall_kickout)
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    //.fontWeight(.semibold)
                    .padding(.leading, -4)
                    
                case Kickout.low.rawValue:
                    Text(skateSpot.overall_kickout)
                    .foregroundColor(.green)
                    .font(.subheadline)
                    //.fontWeight(.semibold)
                    .padding(.leading, -4)
                
                default:
                    Text("N/A")
            }
        }
    }
}

//struct KickoutDistanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        KickoutDistanceView()
//    }
//}
