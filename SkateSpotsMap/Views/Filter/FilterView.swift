//
//  FilterView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI



struct FilterView: View {
    @EnvironmentObject var searchViewModel : SearchViewModel
    @State var inputKickout : String
    @State var inputDistance : Double
    @State var inputRating : Int
    
    @State var inputFeatures : [String:Bool]
    
    var featureStrings = Feature.allFeatures
    var tagStrings = Tag.allTags
    @State var showingAlert = false
//    @State var allRatings = ["1", "2", "3", "4", "5"]
//    @State var test = false
//    @State var featuresEnabled [String] = []
    
//    @State var inputKickout = ""
//    @State var inputDistance = 3.0
//    @State var inputRating = 3

    
    
    var body: some View {
        NavigationStack{
            //ZStack{
                Form{
                    Section(header: Text("Options")){
                        Picker(selection: $inputKickout, label: Text("Kickout Rating")){
                            ForEach(Kickout.allKickout, id:\.self){inputKickout in
                                Text(inputKickout).tag(inputKickout)
                            }
                        }
                        .onChange(of: inputKickout){ newInput in
                            var _ = print(inputKickout)
                            //searchViewModel.updateFeatures(inputKickout: inputKickout, inputMinAvgRating: inputRating, inputMaxDistance: inputDistance)
                            searchViewModel.kickout = inputKickout
                        }
                        HStack{
                            Text("Maximum Distance")
                            Text("0")
                            VStack{
                                Slider(value: $inputDistance, in:0...25, step: 1)
                                Text("\(Int(self.inputDistance))")
                            }
                            .onChange(of: inputDistance){newInput in
                                var _ = print(inputDistance)
                                searchViewModel.maxDistance = inputDistance
                            }
                            Text("25")
                        }
                        
                        Picker(selection: $inputRating, label: Text("Minimum Average Rating"))
                        {
                            ForEach(1..<6, id:\.self){i in
                                Text("\(i)")
                            }
                        }
                        .onChange(of: inputRating){newInput in
                            var _ = print(inputRating)
                            searchViewModel.minAvgRating = inputRating
                        }
                        VStack{
                            Text("Features")
                            HStack{
                                ForEach(featureStrings, id: \.self){ f in
                                    FeatureButtonView(feature:f, isSelected: searchViewModel.getFeatureState(feature: f))
                                }
                            }
                        }
                        VStack{
                            Text("Tags")
                            HStack{
                                ForEach(tagStrings, id: \.self){ t in
                                    TagButtonView(tag:t, isSelected: searchViewModel.getTagState(tag: t))
                                }
                            }
                        }

                    }
                }
                .overlay(alignment : .topTrailing) {
//                    Button("Clear All", action: {
//                        searchViewModel.clearAll()
//
//                    })
                    Button("Clear Filters") {
                        showingAlert = true
                    }
                    .alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text("Clear all filters?"),
                            primaryButton: .destructive(Text("Clear")) {
                                searchViewModel.clearAll()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    .padding()
                    
                }
                
            //}
//            .frame(
//                maxWidth: .infinity,
//                maxHeight: .infinity,
//                alignment: Alignment.topLeading
//            )
            
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
