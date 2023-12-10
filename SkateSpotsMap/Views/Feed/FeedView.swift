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
        ScrollView(.vertical) {
            VStack {
                Text("Spot Feed")
                    .font(.title)
                ForEach(allClips) { clip in
                    ClipRowView(clip: clip)
                }
            }
        }.onAppear{allClips = clipViewModel.clips}
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
