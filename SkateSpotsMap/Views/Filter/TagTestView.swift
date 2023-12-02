//
//  TagTestView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/1/23.
//

import SwiftUI

struct TagTestView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button{
            
        }label: {
            TagView(tags: [TagViewItem(title: "cat", isSelected: false)])
        }
        Button{
            
        }label: {
            TagView(tags: [TagViewItem(title: "dog", isSelected: false)])
        }

    }
}

struct TagTestView_Previews: PreviewProvider {
    static var previews: some View {
        TagTestView()
    }
}
