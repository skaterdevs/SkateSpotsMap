//
//  ContentView.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/2/23.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
      var skateSpots = SkateSpotViewModel()
        TabView() {
            MapView()
            .tabItem {
                Image(systemName: "rectangle.stack.person.crop.fill")
                Text("Feed")
            }.tag(1)
            MapView()
              .tabItem {
                Image(systemName: "map.fill")
                Text("Map")
            }.tag(2)
            SearchSpotsView()
                .tabItem{
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                }.environmentObject(skateSpots)
          }
      }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
