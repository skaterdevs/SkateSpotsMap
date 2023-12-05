//
//  SwiftUIView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI


struct FeatureView: View {
    //replace with features
    var selected : String
    var features = Feature.allFeatures
    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(features, id: \.self) {feature in
//                if feature != selected{
//                    Image(systemName:"star.fill")
//                }
//                else{
//                    Image(systemName:"star")
//                }
//                
//            }
////            ForEach(filled..<5, id: \.self) {_ in
////                return Image(systemName:"star")
////            }
        }
    }
}

struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView(selected:"goodbye")
    }
}

