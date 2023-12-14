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
                        //KickoutFormView(inputKickout: inputKickout)
                        //DistanceFormView(inputDistance: inputDistance)
//                        RatingFormView(inputRating: inputRating)
                        
                        Picker(selection: $inputKickout, label: Text("Kickout Rating")){
                            ForEach(Kickout.allKickout, id:\.self){inputKickout in
                                Text(inputKickout).tag(inputKickout)
                            }
                        }
                        .onChange(of: inputKickout){ newInput in
                            var _ = print(inputKickout)
                            filterViewModel.kickout = inputKickout
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
                        }
                        
                        VStack{
                            Text("Features:").frame(maxWidth: .infinity, alignment: .leading)
                            HStack{
                                ForEach(featureStrings, id: \.self){ f in
                                    FeatureButtonView(feature:f, isSelected: filterViewModel.getFeatureState(feature: f))
                                }
                            }
                        }

                        VStack{
                            Text("Tags:").frame(maxWidth: .infinity, alignment: .leading)
                            List{
                                ForEach(tagStrings, id: \.self){ t in
                                    TagButtonView(tag:t, isSelected: filterViewModel.getTagState(tag: t))
                                    //Text(t)
                                    Spacer()
                                }
                            }
                            
                        }
                        
                    }
                    Section{
                        Button {
                            showingAlert = true
                        } label: {
                            Text("Clear Filters").frame(maxWidth: .infinity)
                        }
                        .foregroundColor(.red)
                        .cornerRadius(8)
                        .alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Clear all filters?"),
                                primaryButton: .destructive(Text("Clear")) {
                                    filterViewModel.clearAll()
                                    self.inputKickout = filterViewModel.kickout
                                    self.inputRating = filterViewModel.minAvgRating
                                },
                                secondaryButton: .cancel()
                            )
                        }
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
