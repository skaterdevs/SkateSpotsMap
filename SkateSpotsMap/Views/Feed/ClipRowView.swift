//
//  ClipRowView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 12/10/23.
//

import SwiftUI
import AVKit
import Foundation
import Amplify

struct ClipRowView: View {
    @State var clip: Clip
    @State var localLikes = 0
    @State var localDislikes = 0
    @State var hasNotInteracted = true
    @State var image = UIImage()
    @State var notDownloaded = true
    
    @ObservedObject var clipViewModel = ClipViewModel()
    @ObservedObject var skateSpotViewModel = SkateSpotViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: image).resizable().padding([.leading], 0)
                    .frame(width: 30.0, height: 30.0).clipShape(Circle())
                Text(clip.user.username)
                    .fontWeight(.regular)
                Spacer()
                Text(skateSpotViewModel.findSkateSpot(clip.location)?.name ?? "NOTHING")
                    .fontWeight(.regular)
                    .padding(.trailing, 10.0)
            }.onAppear() {
                downloadImage(clip.user.avatar)
            }.padding(.leading, 10.0)
            let videoURL = URL(string: clip.media[0])
            let player = AVPlayer(url: videoURL!)
            VideoPlayer(player: player)
                .aspectRatio(CGSize(width: 9, height: 14), contentMode: .fill)
                .clipShape(Rectangle())
            HStack {
                Button(action: {
                    liked()
                }) {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("\(localLikes)")
                }
                .padding([.leading], 10)
                
                Button(action: {
                    disliked()
                }) {
                    Image(systemName: "hand.thumbsdown.fill")
                    Text("\(localDislikes)")
                }
                .padding([.leading], 10)
                Spacer()
            }.onAppear() {
                localLikes = clip.likes
                localDislikes = clip.dislikes
            }
            Divider()
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
    
    func liked() {
        if(hasNotInteracted){
            hasNotInteracted = false
            localLikes += 1
            var updatedClip = clip
            updatedClip.likes = localLikes
            // Update Firebase
            clipViewModel.update(clip: updatedClip)
            // Update local
            clip = updatedClip
        }
    }
    
    func disliked() {
        if(hasNotInteracted){
            hasNotInteracted = false
            localDislikes += 1
            var updatedClip = clip
            updatedClip.dislikes = localDislikes
            // Update Firebase
            clipViewModel.update(clip: updatedClip)
            // Update local
            clip = updatedClip
        }
    }
}

//#Preview {
//    ClipRowView(clip: .example)
//}
