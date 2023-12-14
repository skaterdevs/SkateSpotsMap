//
//  LazyTestView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/13/23.
//

import SwiftUI

struct LazyTestView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    let columns = [
        GridItem(.adaptive(minimum: 80))
                //GridItem(.fixed(50)),
                //GridItem(.flexible()),
//                GridItem(.flexible())
        ]
    let rows = [
        //GridItem(.flexible())
        GridItem(.adaptive(minimum: 80))
    ]
    var tagStrings = Tag.allTags
    var body: some View {
        ScrollView{
            LazyHGrid(rows: rows){
                ForEach(tagStrings, id: \.self){ t in
                    LazyVGrid(columns:columns){
                        TagButtonView(tag:t, isSelected: filterViewModel.getTagState(tag: t))
                    }
                }
            }
        }
        
    }
}

struct LazyTestView_Previews: PreviewProvider {
    static var previews: some View {
        LazyTestView()
    }
}
