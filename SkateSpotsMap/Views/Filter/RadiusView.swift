//
//  RadiusView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/1/23.
//

import SwiftUI

struct RadiusView: View {
    @State private var distance = 20.0
    //just needs a way to add to filter
    var body: some View {
        VStack{
            Slider(
                value: $distance,
                in: 0...20,
                step: 1
            ) {
                Text("Distance")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("20")
            }
            Text("\(Int(distance)) miles")
        }
        
    }
}

//struct RadiusView_Previews: PreviewProvider {
//    static var previews: some View {
//        RadiusView()
//    }
//}
