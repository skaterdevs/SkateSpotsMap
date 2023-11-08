//
//  SkateSpotOverviewView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/8/23.
//

import SwiftUI

struct SkateSpotOverviewView: View {
  var skateSpot: SkateSpot
  
  var body: some View {
    VStack {
      
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
        HStack(spacing: 20) {
          // TODO: make show feature images
          ForEach(skateSpot.features, id: \.self) { feature in
            Text(feature)
          }
        }
      }
      
    }
  }
}

struct SkateSpotOverviewView_Previews: PreviewProvider {
  static var previews: some View {
    SkateSpotOverviewView(skateSpot: SkateSpot.example)
  }
}

//#Preview {
//  SkateSpotOverviewView(skateSpot: .example)
//}
