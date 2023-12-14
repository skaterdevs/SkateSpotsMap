//
//  FilterView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI



struct FilterView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    @State var inputKickout : String
    @State var inputDistance : Double
    @State var inputRating : Int
    
    var featureStrings = Feature.allFeatures
    var tagStrings = Tag.allTags
    @State var showingAlert = false

    
    
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
                            filterViewModel.kickout = inputKickout
                            filterViewModel.filterChange = true
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
                                filterViewModel.maxDistance = inputDistance
                                filterViewModel.filterChange = true
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
                            filterViewModel.minAvgRating = inputRating
                            filterViewModel.filterChange = true
                        }
                        VStack{
                            Text("Features")
                            HStack{
                                ForEach(featureStrings, id: \.self){ f in
                                    FeatureButtonView(feature:f, isSelected: filterViewModel.getFeatureState(feature: f))
                                }
                            }
                        }
//                        Picker("Tags", selection: $inputKickout) {
//                            TagListView()
//                        }
//                        .pickerStyle(.navigationLink)

                        VStack{
//                            LazyTestView()
                            Text("Tags")
                            TagListView()
//                            Form{
//                                ForEach(tagStrings, id: \.self){ t in
//                                    //TagButtonView(tag:t, isSelected: filterViewModel.getTagState(tag: t))
//                                    Text(t)
//                                }
//                            }
                            
                        }
                        
                    }
                    Section{
                        //HStack(alignment: .center){
                            Button {
                                showingAlert = true
                            } label: {
                                Text("Clear Filters").frame(maxWidth: .infinity)
                            }
                            //.background(.red)
                            .foregroundColor(.red)
//                            .buttonStyle(.bordered)
                            .cornerRadius(8)
                            .alert(isPresented:$showingAlert) {
                                Alert(
                                    title: Text("Clear all filters?"),
                                    primaryButton: .destructive(Text("Clear")) {
                                        filterViewModel.clearAll()
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                        //}
                    }
                   
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
