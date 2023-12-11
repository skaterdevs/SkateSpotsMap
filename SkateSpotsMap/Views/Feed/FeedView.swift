//
//  FeedView.swift
//  SkateSpotsMap
//
//  Created by Daniel Johann Arriola on 11/10/23.
//

import SwiftUI
import Foundation

struct FeedView: View {
    @ObservedObject var clipViewModel = ClipsRepository()
    
    @State var allClips = [Clip]()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    // Header
                    HStack {
                        Button {
                        } label: {
                            Label("", systemImage: "video.badge.plus.fill")
                                .foregroundColor(Color.clear)
                        }
                        Spacer()
                        Text("Spot Feed").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Image("video.badge.plus.fill")
                        NavigationLink(destination:
                                        {ClipUploadView()},
                                       label: {
                            Label("", systemImage: "video.badge.plus.fill")
                        })
                    }
                    // Feed
                    ForEach(allClips) { clip in
                        ClipRowView(clip: clip)
                    }
                }.onAppear{allClips = clipViewModel.clips}
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
