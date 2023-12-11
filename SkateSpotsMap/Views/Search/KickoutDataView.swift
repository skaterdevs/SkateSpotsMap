//
//  KickoutDataView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/11/23.
//

import SwiftUI

struct KickoutDataView: View {
    var skateSpot : SkateSpot
    var kickoutColor : Color
    var body: some View {
        switch kickoutColor{
            case .black:
                    Image(systemName:"exclamationmark.triangle.fill")
                        .padding(.trailing, -4)
                        .foregroundColor(Color(UIColor.darkGray))
                        .scaledToFit()
                    
            default:
                    Image(systemName:"exclamationmark.triangle.fill")
                        .padding(.trailing, -4)
                        .foregroundColor(kickoutColor)
                        .scaledToFit()
            }
    
    
        Text("Kickout Rating:")
        .font(.subheadline)
        .foregroundColor(Color(UIColor.darkGray))
        .fontWeight(.semibold)
    
        Text(skateSpot.overall_kickout)
        .foregroundColor(kickoutColor)
        .font(.subheadline)
        //.fontWeight(.semibold)
        .padding(.leading, -4)
    }
}


