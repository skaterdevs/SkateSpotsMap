//
//  TagListView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/13/23.
//

import SwiftUI

struct TagListView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    
    var featureStrings = Feature.allFeatures
    var tagStrings = Tag.allTags
    
    var body: some View {
        VStack{
            List{
                ForEach(tagStrings, id: \.self){ t in
                    TagButtonView(tag:t, isSelected: filterViewModel.getTagState(tag: t))
                    //Text(t)
                    Spacer()
                }
            }

        }

    }
}






struct TagListView_Previews: PreviewProvider {
    static var previews: some View {
        TagListView()
    }
}
