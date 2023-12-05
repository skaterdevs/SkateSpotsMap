//
//  SwiftUIView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI


struct FeatureView: View {
    @State private var allFeatures = Feature.allFeatures
    var backColor = Color.white //both temporary
    var textColor = Color.blue
    var body: some View {
        HStack{
            ForEach(allFeatures, id: \.self){ feature in
                Button{
                    //same as feature
                    //feature.switchStates or something like that which in would address inclusion in filter
                    //feature.switchColors - keep a record of current colors, switch it to the other colors
                    //to indicate selection, could be grouped with switchStates
                }
                label:{
                    Text(feature)//need to switch to icons
                }
                .background(backColor)
                .foregroundColor(textColor)
                .buttonStyle(.bordered)
                .cornerRadius(8)
//                    or
//                .background(.white)
//                .foregroundColor(.blue)
            }
        }
        
    }
}

struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView()
    }
}

