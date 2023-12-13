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
    @State var clip: Clip
    @State var localLikes = 0
    @State var localDislikes = 0
    @State var hasNotInteracted = true
    
    @ObservedObject var clipViewModel = ClipViewModel()
    
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
                .aspectRatio(CGSize(width: 9, height: 16), contentMode: .fill)
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
