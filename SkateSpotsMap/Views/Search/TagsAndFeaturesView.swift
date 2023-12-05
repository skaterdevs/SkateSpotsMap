//
//  TagsAndFeaturesView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI

struct TagsAndFeaturesView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack{
            Text("Tags:").font(.system(size:14)).multilineTextAlignment(.leading)
            //ForEach(skateSpot.tags, id: \.self){ tag in
            //  TagsView(tag)
            ForEach(skateSpot.tags, id: \.self){ tag in
                Text(tag).fontWeight(.light).font(.system(size:10)).padding(.top, 2)
            }
        }
        //Replace with images, will most likely need a VStack to avoid graphical issues
        HStack{
            Text("Features:").font(.system(size:14)).multilineTextAlignment(.leading)
            //ForEach(skateSpot.features, id: \.self){ feature in
            //  FeatureViews(feature)
            ForEach(skateSpot.features, id: \.self){ feature in
                Text(feature).fontWeight(.light).font(.system(size:10)).padding(.top, 2)
            }
        }
    }
}

//struct TagsAndFeaturesView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagsAndFeaturesView()
//    }
//}
