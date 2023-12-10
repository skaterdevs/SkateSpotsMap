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
                Image(systemName: "map.fill")
                Text("Map")
            }.tag(1)
            SearchView()
            .tabItem{
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Search")
            }.tag(2)
            FeedView()
            .tabItem {
                Image(systemName: "rectangle.stack.person.crop.fill")
                Text("Feed")
            }.tag(3)
          }
      }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
