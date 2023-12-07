//
//  FilterView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI



struct FilterView: View {
    @ObservedObject var searchViewModel = SearchViewModel()
    @State var inputKickout : String = SearchViewModel().kickout
    @State var inputDistance : Double = SearchViewModel().maxDistance
    @State var features : [String] = SearchViewModel().selectedFeatures
    @State var inputRating : Int = SearchViewModel().minAvgRating
    @State var allRatings = ["1", "2", "3", "4", "5"]
    @State var test = false
//    @State var featuresEnabled [String] = []
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Button(action: {
                        
                    }) {
                        Text("Submit")
                    }
                }
                
                Section(header: Text("Options")){
                    Picker(selection: $inputKickout, label: Text("Kickout Rating")){
                        ForEach(Kickout.allKickout, id:\.self){inputKickout in
                            Text(inputKickout).tag(inputKickout)
                        }
                    }.onChange(of: self.inputKickout){ newInput in
                        var _ = print(self.inputKickout)
                        searchViewModel.updateFeatures(inputKickout: self.inputKickout, inputMinAvgRating: self.inputRating, inputMaxDistance: self.inputDistance)
                    }
                    HStack{
                        Text("Maximum Distance")
                        Text("0")
                        VStack{
                            Slider(value: $inputDistance, in:0...25, step: 1)
                            Text("\(Int(self.inputDistance))")
                        }
                        Text("25")
                    }
                    
                    Picker(selection: $inputRating, label: Text("Minimum Average Rating"))
                    {
                        ForEach(0..<6, id:\.self){i in
                            Text("\(i)")
                        }
                    }.onChange(of: self.inputRating){ newInput in
                        SearchViewModel().minAvgRating = self.inputRating
                    }
                    
                }
//                ForEach(Feature.allFeatures, id: \.self){i in
//                    Toggle(i, isOn: $test)
//                }

            }.environmentObject(searchViewModel)
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
