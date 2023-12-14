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
    @ObservedObject var skateSpotVM = SkateSpotViewModel()
    @ObservedObject var repo = UserRepository()
    @State var selectedTab = "SkateSpots"
    let picWidth = UIScreen.main.bounds.width * 0.50
    @State var image = UIImage()
    @State var notDownloaded = true
    var body: some View {
        NavigationView {
            VStack {
                Text(userVM.findUser(User.defaultUser)?.username ?? "")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
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
                
                HStack() {
                    Spacer()
                    Text("Skate Spots")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }.frame(height: 40)
                
                if let user = userVM.findUser(User.defaultUser) {
                    let maybeSpots: [SkateSpot?] = user.spots.map {skateSpotVM.findSkateSpot($0)}
                    let spots: [SkateSpot] = maybeSpots.filter{$0 != nil}.map{$0!}
                    List {
                        ForEach(spots) { spot in
                            UserSkateSpotRowView(skateSpot: spot)
                        }
                    }
                }
                
//                Picker("", selection: $selectedTab) {
//                    Text("Skate Spots").tag("SkateSpots")
//                    NavigationLink(
//                        destination: FeedView(),
//                        label: {
//                            Text("Clips")
//                        }).tag("Clips")
//                    Text("Clips").tag("Clips")
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
//
//                TabView(selection: $selectedTab) {
//                    UserSkateSpotsView()
//                        .tag("SkateSpots")
//                    UserClipsView()
//                        .tag("Clips")
//                }
//                .tabViewStyle(.page(indexDisplayMode: .never))
            }.onAppear() {downloadImage(userVM.findUser(User.defaultUser)?.avatar ?? "") }
                .padding()
        }
    }
    
    func downloadImage(_ image_key: String) {
        if notDownloaded && image_key != "" {
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
            notDownloaded = false
        }
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
