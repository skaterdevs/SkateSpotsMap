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
    
    var body: some View {
        VStack {
            HStack {
                Text(
                    clip.user.username)
                Text(
                    clip.location)
            }
            let videoURL = URL(string: clip.media[0])
            let player = AVPlayer(url: videoURL!)
            VideoPlayer(player: player)
                .frame(height: 200)
                .clipShape(Rectangle())
            HStack {
                Button(action: {
                    }) {
                        Image(systemName: "hand.thumbsup.fill")
                        Text("\(clip.likes)")
                    }
                .padding()

                Spacer()

                Button(action: {
                    }) {
                        Image(systemName: "hand.thumbsdown.fill")
                        Text("\(clip.dislikes)")
                    }
                .padding()
            }
        }
    }
}

//#Preview {
//    ClipRowView(clip: .example)
//}
