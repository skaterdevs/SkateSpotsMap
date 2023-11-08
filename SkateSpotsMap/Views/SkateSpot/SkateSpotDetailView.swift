//
//  SkateSpotDetailView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct SkateSpotDetailView: View {
    var skateSpot: SkateSpot

  
    var body: some View {
      VStack{
        
        HStack{
          Text(skateSpot.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        
        // image carousel
        ScrollView(.horizontal) {
          HStack(spacing: 10) {
            // TODO: make show skateSpot.photos
            ForEach(skateSpot.photos, id: \.self) { photo in
              Text("File name: \(photo)")
                  .foregroundStyle(.white)
                  .font(.largeTitle)
                  .frame(width: 200, height: 200)
                  .background(.red)
//              Image(photo)
//                .cornerRadius(5.0)
            }
          }
        }
        
        // TODO: two buttons
        // one to show overview, one to show reviews
        HStack {
          Spacer()
          Button("Overview") {
//            showSkateSpotOverview()
          }
          Spacer()
          Button("Reviews") {
//            showSkateSpotReviews()
          }
          Spacer()
        }
        
        Divider()
        
        HStack {
          Spacer()
          VStack {
            Text("Distance".uppercased()).fontWeight(.light)
            Text("2.1 mi").fontWeight(.bold)
          }
          Spacer()
          VStack {
            Text("Rating".uppercased()).fontWeight(.light)
            Text("\(String(format: "%.2f", skateSpot.rating_avg))").fontWeight(.bold)
          }
          Spacer()
          VStack {
            Text("Kick-out Factor".uppercased()).fontWeight(.light)
            Text("\(skateSpot.overall_kickout)").fontWeight(.bold)
          }
          Spacer()
        }
        
        Divider()
        
        VStack {
          HStack {
            HStack(spacing: 20) {
              // TODO: make show skateSpot.photos
              ForEach(skateSpot.tags, id: \.self) { tag in
                Text(tag)
                  .padding(10)
                  .overlay(
                    RoundedRectangle(cornerRadius: 30)
                      .stroke(Color.black, lineWidth: 1)
                  )
              }
            }
          }
        }
        
        Divider()
        
        // TODO: Features
        
        VStack {
          HStack {
            HStack(spacing: 20) {
              // TODO: make show feature images
              ForEach(skateSpot.features, id: \.self) { feature in
                Text(feature)
              }
            }
          }
        }
        
      }
      Spacer()  // To force the content to the top
    }
}

#Preview {
  SkateSpotDetailView(skateSpot: .example)
}
