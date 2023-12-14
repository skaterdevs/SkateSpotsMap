//
//  DistanceFormView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/13/23.
//

import SwiftUI

struct DistanceFormView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    @State var inputDistance : Double
    
    var body: some View {
        HStack{
            Text("Maximum Distance")
            Text("0")
            VStack{
                Slider(value: $inputDistance, in:0...25, step: 1)
                Text("\(Int(self.inputDistance))")
            }
            .onChange(of: inputDistance){newInput in
                var _ = print(inputDistance)
                filterViewModel.maxDistance = inputDistance
            }
            Text("25")
        }
    }
}

//struct DistanceFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        DistanceFormView()
//    }
//}
