//
//  TagButtonView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/9/23.
//

import SwiftUI

struct TagButtonView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    var tag : String
    var isSelected : Bool?
    var buttonColors : [Color] {
        guard let unwrapped = isSelected else{
            return [.red, .red]
        }
        if unwrapped{
            return [.blue, .white]
        }
        else{
            return [.white, .blue]
        }
        
    }
    
    
    var body: some View {
        Button {
            filterViewModel.updateTagState(tag:tag)
        } label: {
            Text(tag)
                .frame(maxWidth: .infinity)
        }
        .background(buttonColors[0])
        .foregroundColor(buttonColors[1])
        .buttonStyle(.bordered)
        .cornerRadius(8)
        
        //.frame(minWidth: 300, maxWidth:.infinity)
    }
}

//struct TagButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagButtonView()
//    }
//}
