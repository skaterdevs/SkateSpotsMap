//
//  ClipRowView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 12/10/23.
//

import SwiftUI
import AVKit
import Foundation

struct ClipRowView: View {
    var clip: Clip
    @State var localLikes = 0
    @State var localDislikes = 0
    @State var hasNotInteracted = true
    
    @ObservedObject var clipViewModel = ClipsRepository()
    
    var body: some View {
        VStack {
            HStack {
                Image(clip.user.avatar).resizable().padding([.leading], 10)
                    .frame(width: 30.0, height: 30.0).clipShape(Circle())
                Text(clip.user.username)
                Spacer()
                Text(clip.location)
            }
            let videoURL = URL(string: clip.media[0])
            let player = AVPlayer(url: videoURL!)
            VideoPlayer(player: player)
                .frame(height: 200)
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
        }
        
    }
    
    func liked() {
//       if clip is in likes, remove from likes and subtract
//        let newLikedNum = clip.likes + 1
//        var newClip = clip
//        newClip.likes = newLikedNum
//        clipViewModel.update(newClip)
        if(hasNotInteracted){
            localLikes+=1
            hasNotInteracted=false
        }
    }
    
    func disliked() {
        //        if clip is in dislikes, remove from dislikes and add 1
//        let newDislikedNum = clip.dislikes + 1
//        var newClip = clip
//        newClip.dislikes = newDislikedNum
//        clipViewModel.update(newClip)
        if(hasNotInteracted){
            localDislikes+=1
            hasNotInteracted=false
        }
    }
}

//#Preview {
//    ClipRowView(clip: .example)
//}
