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
                    Image(systemName:"exclamationmark.triangle.fill")
                    .padding(.trailing, -5)
                    .foregroundColor(.red)
                    .scaledToFit()
                
                    Text("Kickout Rating:")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.darkGray))
                    .fontWeight(.semibold)
                
                    Text(skateSpot.overall_kickout)
                    .foregroundColor(.red)
                    .font(.subheadline)
                    //.fontWeight(.semibold)
                    .padding(.leading, -4)
                
                case Kickout.medium.rawValue:
                Image(systemName:"exclamationmark.triangle.fill")
                    .padding(.trailing, -5)
                    .foregroundColor(.orange)
                    .scaledToFit()
                
                    Text("Kickout Rating:")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.darkGray))
                    .fontWeight(.semibold)
                
                    Text(skateSpot.overall_kickout)
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    //.fontWeight(.semibold)
                    .padding(.leading, -4)
                    
                case Kickout.low.rawValue:
                Image(systemName:"exclamationmark.triangle.fill")
                    .padding(.trailing, -5)
                    .foregroundColor(.green)
                    .scaledToFit()
                
                    Text("Kickout Rating:")
                    .font(.subheadline)
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
                
                    Text(skateSpot.overall_kickout)
                    .foregroundColor(.green)
                    .font(.subheadline)
                    //.fontWeight(.semibold)
                    .padding(.leading, -4)
                
                default:
                    Image(systemName:"exclamationmark.triangle.fill")
                    .padding(.trailing, -5)
                    .foregroundColor(Color(UIColor.darkGray))
                    .scaledToFit()
                
                    Text("Kickout Rating:").font(.subheadline)
                    .foregroundColor(Color(UIColor.darkGray))
                    .fontWeight(.semibold)
                
                    Text("N/A")
                    .font(.subheadline)
            }
        }
    }
}

//struct KickoutDistanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        KickoutDistanceView()
//    }
//}
