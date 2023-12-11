//
//  UserView.swift
//  SkateSpotsMap
//
//  Created by Daniel Johann Arriola on 12/10/23.
//

import SwiftUI
import Amplify

struct UserView: View {
    @ObservedObject var userVM = UserViewModel()
    @State var selectedTab = "SkateSpots"
    let picWidth = UIScreen.main.bounds.width * 0.50
    @State var image = UIImage()
    @State var notDownloaded = true
    var body: some View {
        VStack {
            Text(userVM.findUser(User.defaultUser)?.username ?? "")
                .font(.largeTitle)
            
            Image(uiImage: image)
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
        }.onAppear() {downloadImage(userVM.findUser(User.defaultUser)?.avatar ?? "") }
        .padding()
    }
    
    func downloadImage(_ image_key: String) {
        if notDownloaded && image_key != "" {
//            image_keys.forEach { image_key in
            Amplify.Storage.downloadData(key: image_key) {
                result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)!
                    }
                case .failure(let error):
                    print(error)
                }
            }
//            }
            notDownloaded = false
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
