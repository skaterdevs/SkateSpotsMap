//
//  ClipUploadView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 12/10/23.
//

import AVKit
import PhotosUI
import SwiftUI
import Amplify

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// Movie Struct, LoadState, and Switch statement from:
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-import-videos-using-photospicker
struct Movie: Transferable {
    let url: URL

    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { received in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")

            if FileManager.default.fileExists(atPath: copy.path()) {
                try FileManager.default.removeItem(at: copy)
            }

            try FileManager.default.copyItem(at: received.file, to: copy)
            return Self.init(url: copy)
        }
    }
}

struct ClipUploadView: View {
    @ObservedObject var clipViewModel = ClipViewModel()
    @ObservedObject var skateSpotRepo = SkateSpotRepository()
    @ObservedObject var userViewModel = UserViewModel()
    let defaultUserID: String = "26Dxy1VDAAYuiBSWryMB"
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var media: [String] = []
    @State private var location = ""
    @State private var likes = 0
    @State private var dislikes = 0
    @State private var timestamp = Timestamp()
    
    enum LoadState {
        case unknown, loading, loaded(Movie), failed
    }
    
    @State private var movieClip: Movie?
    @State private var skateSpotSelection: SkateSpot?
    @State private var selectedItem: PhotosPickerItem?
    @State private var loadState = LoadState.unknown

    var body: some View {
        VStack {
            Text("Add A Clip")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .center, spacing: 18) {
                Divider()
            }
            
            // Video Picker
            PhotosPicker("Select a clip...", selection: $selectedItem, matching: .videos)

            switch loadState {
            case .unknown:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded(let movie):
                VideoPlayer(player: AVPlayer(url: movie.url))
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            case .failed:
                Text("Import failed")
            }
            
            VStack(alignment: .center, spacing: 18) {
                Divider()
            }
            
            // Location picker
            Picker("", selection: $skateSpotSelection) {
                Text("Select skate spot...").tag(String?.none)
                ForEach(skateSpotRepo.skate_spots) {skateSpot in
                    Text(skateSpot.name).tag(SkateSpot?.some(skateSpot))
                    // https://stackoverflow.com/questions/59277070/swiftui-picker-selection-binding-not-updating
                }
            }
            .pickerStyle(.menu)
            
            HStack {
                Text("Selected spot: " )
                Text("\(skateSpotSelection?.name ?? "No selection")").fontWeight(.medium)
            }
            
            VStack(alignment: .center, spacing: 18) {
                Divider()
            }
            
            // Submit button
            Button("Submit") {
                guard selectedItem != nil && skateSpotSelection != nil else { return }
                addNewClip()
                clearFields()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            .fontWeight(.medium)
            
            Spacer()
        }
        .onChange(of: selectedItem) { _ in
            Task {
                do {
                    loadState = .loading

                    if let movie = try await selectedItem?.loadTransferable(type: Movie.self) {
                        loadState = .loaded(movie)
                        movieClip = movie
                        print(movieClip?.url ?? "Didn't get value")
                    } else {
                        loadState = .failed
                    }
                } catch {
                    loadState = .failed
                }
            }
        }
    }
    
    func addNewClip() {
        // Find user
        var user = userViewModel.findUser(defaultUserID)
        var embeddedUser = Reviewer(id: user!.id!, username: user!.username, avatar: user!.avatar)
        let newID = UUID().uuidString
        uploadVideo(clipID: newID)
        let newClip = Clip(clip_id: newID,
                           // TODO: REPLACE
                           user: embeddedUser,
                           media: ["https://skaterbucket193541-dev.s3.amazonaws.com/public/"+"\(newID+(self.movieClip!.url.absoluteString).suffix(4))"],
                           location: skateSpotSelection!.id ?? "Could not get skate spot id",
                           likes: 0,
                           dislikes: 0,
                           timestamp: Timestamp()
                      )
        clipViewModel.post(clip: newClip)
        // Add clip to user
        user?.clips.append(newID)
        userViewModel.update(user: user!)
    }
    
    func uploadVideo(clipID: String) {
        // TODO: Don't force unwrap
        Amplify.Storage.uploadFile(key: "\(clipID+(self.movieClip!.url.absoluteString).suffix(4))",
                                   local: (self.movieClip!.url))
        { result in
            switch result {
            case .success(let uploadedData):
                print(uploadedData)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func clearFields() {
        media = [String]()
        location = String()
        likes = 0
        dislikes = 0
        timestamp = Timestamp()
    }
}

//#Preview {
//    ClipUploadView()
//}
