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
            }
          }
        }
        
        // overview and reviews
        HStack {
          Spacer()
          NavigationLink(
            destination: SkateSpotOverviewView(skateSpot: skateSpot),
            label: {
              Text("Overview")
            })
          Spacer()
          NavigationLink(
            destination: ReviewListView(skateSpot: skateSpot),
            label: {
              Text("Reviews")
                .foregroundColor(Color.red)
            })
          Spacer()
        }
        
        Divider()
        
        SkateSpotOverviewView(skateSpot: skateSpot)
      }
      Spacer()  // To force the content to the top
    }
}

struct SkateSpotDetailView_Previews: PreviewProvider {
  static var previews: some View {
    SkateSpotDetailView(skateSpot: SkateSpot.example)
  }
}

//#Preview {
//  SkateSpotDetailView(skateSpot: .example)
//}
