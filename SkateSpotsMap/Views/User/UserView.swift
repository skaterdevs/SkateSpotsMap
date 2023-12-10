//
//  UserView.swift
//  SkateSpotsMap
//
//  Created by Daniel Johann Arriola on 12/10/23.
//

import SwiftUI

struct UserView: View {
    @State var selectedTab = "SkateSpots"
    let picWidth = UIScreen.main.bounds.width * 0.50
    var body: some View {
        VStack {
            Text("[User Name]")
                .font(.largeTitle)
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                  Circle()
                    .stroke(Color.white, lineWidth: 4)
                    .shadow(radius: 10)
                )
                .frame(width: picWidth, height: picWidth, alignment: .center)
                .padding()
            
            Picker("", selection: $selectedTab) {
                Text("Skate Spots").tag("SkateSpots")
                Text("Clips").tag("Clips")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
             
            TabView(selection: $selectedTab) {
                UserSkateSpotsView()
                    .tag("SkateSpots")
                UserClipsView()
                    .tag("Clips")
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
