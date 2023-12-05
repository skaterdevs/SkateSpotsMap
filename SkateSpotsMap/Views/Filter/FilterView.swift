//
//  FilterView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI

//class isPressed: ObservableObject{
//    @Published var pressed = false
//}

struct FilterView: View {
    @State private var pressed:Bool = false

    var body: some View {
        VStack{
//            HStack{
//                StarRowView()
//                RadiusView()
//            }
            HStack{
                ForEach(Feature.allFeatures, id: \.self){ feature in
                    self.pressed:false
                    
                    Text(feature).onTapGesture{
                        //pressed.toggle()
                        //FeatureView(selected:feature)
                    }
                    //pressed.onChange()
//                    Button{
//                        pressed = true
//
//                    }
//                    label:{
//                        Text(feature)
//
//                    }
//                    if pressed {
//                        FeatureView(selected:feature)
//                        //can't toggle for some reason
//                        //resetState()
//                    }
//                    //resetState()
//                    Button(feature) {
//                        FeatureView(selected:feature)
//                    }
//
                }
            }
            
            //FilterView()
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
