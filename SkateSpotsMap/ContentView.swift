//
//  ContentView.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/2/23.
//

import SwiftUI

struct ContentView: View {
  var skateSpotList = SkateSpotViewModel()
  var body: some View {
      
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
                }
          }
      }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
