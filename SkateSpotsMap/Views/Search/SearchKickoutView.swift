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
                
//                    Image(systemName:"exclamationmark.triangle.fill")
//                    .padding(.trailing, -4)
//                    .foregroundColor(.red)
//                    .scaledToFit()
//
//                    Text("Kickout Rating:")
//                    .font(.subheadline)
//                    .foregroundColor(Color(UIColor.darkGray))
//                    .fontWeight(.semibold)
//
//                    Text(skateSpot.overall_kickout)
//                    .foregroundColor(.red)
//                    .font(.subheadline)
//                    //.fontWeight(.semibold)
//                    .padding(.leading, -4)
                
                case Kickout.medium.rawValue:
                    KickoutDataView(skateSpot: skateSpot, kickoutColor: .orange)
                
//                Image(systemName:"exclamationmark.triangle.fill")
//                    .padding(.trailing, -4)
//                    .foregroundColor(.orange)
//                    .scaledToFit()
//
//                    Text("Kickout Rating:")
//                    .font(.subheadline)
//                    .foregroundColor(Color(UIColor.darkGray))
//                    .fontWeight(.semibold)
//
//                    Text(skateSpot.overall_kickout)
//                    .foregroundColor(.orange)
//                    .font(.subheadline)
//                    //.fontWeight(.semibold)
//                    .padding(.leading, -4)
                    
                case Kickout.low.rawValue:
                    KickoutDataView(skateSpot: skateSpot, kickoutColor: .green)
                
//                    Image(systemName:"exclamationmark.triangle.fill")
//                    .padding(.trailing, -4)
//                    .foregroundColor(.green)
//                    .scaledToFit()
//
//                    Text("Kickout Rating:")
//                    .font(.subheadline)
//                    .foregroundColor(.green)
//                    .fontWeight(.semibold)
//
//                    Text(skateSpot.overall_kickout)
//                    .foregroundColor(.green)
//                    .font(.subheadline)
//                    //.fontWeight(.semibold)
//                    .padding(.leading, -4)
                
                default:
                    KickoutDataView(skateSpot: skateSpot, kickoutColor: .black)
                
//                    Image(systemName:"exclamationmark.triangle.fill")
//                    .padding(.trailing, -4)
//                    .foregroundColor(Color(UIColor.darkGray))
//                    //.scaledToFit()
//
//                    Text("Kickout Rating:").font(.subheadline)
//                    .foregroundColor(Color(UIColor.darkGray))
//                    .fontWeight(.semibold)
//
//                    Text("N/A")
//                    .font(.subheadline)
//                    .padding(.leading, -4)
            }
        }
    }
}

//struct KickoutDistanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        KickoutDistanceView()
//    }
//}
