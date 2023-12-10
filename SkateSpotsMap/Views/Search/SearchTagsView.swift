//
//  SearchTagsView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/10/23.
//

import SwiftUI

struct SearchTagsView: View {
    var skateSpot : SkateSpot
    var body: some View {
        HStack{
            Text("Tags:").font(.system(size:14)).multilineTextAlignment(.leading)
            //ForEach(skateSpot.tags, id: \.self){ tag in
            ForEach(skateSpot.tags, id: \.self){ tag in
                Text(tag).fontWeight(.light).font(.system(size:10)).padding(.top, 2)
            }
        }
    }
}

//struct SearchTagsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchTagsView()
//    }
//}
