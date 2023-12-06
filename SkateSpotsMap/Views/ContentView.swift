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
      Text("Hello World!")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
