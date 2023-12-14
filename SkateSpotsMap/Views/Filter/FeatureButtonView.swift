//
//  featureButtonView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/9/23.
//

import SwiftUI

struct FeatureButtonView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    var feature : String
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
        Button(feature, action: {
            filterViewModel.updateFeatureState(feature: feature)
        })
        .background(buttonColors[0])
        .foregroundColor(buttonColors[1])
        .buttonStyle(.bordered)
        .cornerRadius(8)
        .padding(.trailing, 1)
    }
}

//struct featureButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        featureButtonView()
//    }
//}
