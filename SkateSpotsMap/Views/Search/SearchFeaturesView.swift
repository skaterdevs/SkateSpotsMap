//
//  SearchFeaturesView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchFeaturesView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack{
            Text("Features:").font(.system(size:14)).multilineTextAlignment(.leading)
            ForEach(skateSpot.features, id: \.self){ feature in
                Text(feature).fontWeight(.light).font(.system(size:10)).padding(.top, 2).fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

//struct SearchFeaturesView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchFeaturesView()
//    }
//}
