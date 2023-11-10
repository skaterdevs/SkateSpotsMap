//
//  NewSkateSpotView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct NewSkateSpotView: View {
    @State private var location = 1
    @State private var name = String()
    @State private var photos = [String]()
    @State private var features = [String]()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            
            Text("Add Skate Spot")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .center, spacing: 12) {
                
                Divider()
            }
            // location selection
            Text("Location").font(.title3).fontWeight(.semibold)
        
            // name field
            Text("Name").font(.title3).fontWeight(.semibold)
            TextField("Name your new spot...", text: $name)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
            
            // photo entry field
            Text("Photos").font(.title3).fontWeight(.semibold)
            
            // feature selection
            Text("Select Available Features").font(.title3).fontWeight(.semibold)
            HStack {
                ForEach(Feature.allFeatures, id: \.self) { value in
                    Button(action: {
                        if let index = features.firstIndex(of: value) {
                          features.remove(at: index)
                        } else {
                          features.append(value)
                        }
                    }) {
                        Text("\(value)").font(.system(size: 10))
                        if features.contains(value) {
                            Image(systemName: "checkmark")
                        }
                    }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                          .stroke(Color.black, lineWidth: 1)
                    )
                }
            }
                
        }.padding([.bottom, .horizontal],12).frame(maxWidth: .infinity)
    }
}

#Preview {
    NewSkateSpotView()
}
