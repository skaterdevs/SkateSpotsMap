//
//  UserClipsView.swift
//  SkateSpotsMap
//
//  Created by Daniel Johann Arriola on 12/10/23.
//

import SwiftUI
import FirebaseFirestore

struct UserClipsView: View {
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var clipVM = ClipViewModel()
    @ObservedObject var repo = UserRepository()
    var body: some View {
        VStack {
            if let user = userVM.findUser(User.defaultUser) {
                List {
                    ForEach(user.clips.map {clipVM.findClip($0)!}) { clip in
                        Text(clip.id!)
                    }
                }
            } else {
                Text("No Clips")
            }
        }
    }
}

struct UserClipsView_Previews: PreviewProvider {
    static var previews: some View {
        UserClipsView()
    }
}
