//
//  FilterView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI



struct FilterView: View {
    var body: some View {
        VStack{
            Button{
                
            }
            label:
            {
                Text("Clear All Filters")
                //if we want this
            }
            Text("Kickout Rating(s):")
            KickoutView()
            StarRowView()
            Text("Max Distance")
            RadiusView()
            Text("Features:")
            FeatureView()
            Text("Tags:")
            TagView()
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
