//
//  KickoutDistanceView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchKickoutView: View {
    var skateSpot : SkateSpot
    var levelColor : Color = .black
    var body: some View {
        HStack{
            switch skateSpot.overall_kickout{
                case Kickout.high.rawValue:
                    KickoutDataView(skateSpot: skateSpot, kickoutColor: .red)
                
                case Kickout.medium.rawValue:
                    KickoutDataView(skateSpot: skateSpot, kickoutColor: .orange)
                    
                case Kickout.low.rawValue:
                    KickoutDataView(skateSpot: skateSpot, kickoutColor: .green)
                
                default:
                    KickoutDataView(skateSpot: skateSpot, kickoutColor: .black)
            
            }
        }
    }
}

//struct KickoutDistanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        KickoutDistanceView()
//    }
//}
