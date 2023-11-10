//
//  MapView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI
import GoogleMaps

struct MapView: View {
    @State var selectedSkateSpot: SkateSpot?
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    GoogleMapViewModelBridge(goToSkateSpot: { (skateSpot) in
                        self.selectedSkateSpot = skateSpot
                        self.isActive = true
                    })
                    NavigationLink(destination: SkateSpotDetailView(skateSpot: selectedSkateSpot), isActive: $isActive) { EmptyView() }
                }
                
                // Add SkateSpot Button
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        NavigationLink(destination: NewSkateSpotView()) {
                            Image(systemName: "plus")
                                .resizable()
                                .padding(6)
                                .frame(width: 56, height: 56)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                    }.padding(.bottom, 80)
                }.padding(.trailing, 10)
            }
        }
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
