//
//  ClipsRepository.swift
//  SkateSpotsMap
//
//  Created by Jason Perez on 12/5/23.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class ClipsRepository: ObservableObject {
  private let path: String = "Clips"
  private let store = Firestore.firestore()
  
  @Published var clips: [Clip] = []
  private var cancellables: Set<AnyCancellable> = []
  
  init() {
    self.get()
  }
  
  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting Clips: \(error.localizedDescription)")
          return
        }
              
        self.clips = querySnapshot?.documents.compactMap {
          document in try? document.data(as: Clip.self)
        } ?? []
      }
  }
  
  // MARK: CRUD methods
  func create(_ clip: Clip) {
    do {
      let newClip = clip
      _ = try store.collection(path).addDocument(from: newClip)
    } catch {
      fatalError("Unable to add new clip: \(error.localizedDescription).")
    }
  }
  
  func update(_ clip: Clip) {
    guard let clipID = clip.id else { return }
  
    do {
      try store.collection(path).document(clipID).setData(from: clip)
    } catch {
      fatalError("Unable to update clip: \(error.localizedDescription).")
    }
  }
  
  func delete(_ clip: Clip) {
    guard let clipID = clip.id else { return }
    
    store.collection(path).document(clipID).delete {error in
      if let error = error {
        print("Unable to remove clip: \(error.localizedDescription)")
      }
    }
  }
}
