//
//  UserRepository.swift
//  SkateSpotsMap
//
//  Created by Daniel on 11/7/23.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepository: ObservableObject {
  private let path: String = "Users"
  private let store = Firestore.firestore()
  
  @Published var users: [User] = []
  private var cancellables: Set<AnyCancellable> = []
  
  init() {
    self.get()
  }
  
  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting Users: \(error.localizedDescription)")
          return
        }
              
        self.users = querySnapshot?.documents.compactMap {
          document in try? document.data(as: User.self)
        } ?? []
      }
  }
  
  // MARK: CRUD methods
  func create(_ user: User) {
    do {
      let newUser = user
      _ = try store.collection(path).addDocument(from: newUser)
    } catch {
      fatalError("Unable to add new user: \(error.localizedDescription).")
    }
  }
  
  func update(_ user: User) {
    guard let userID = user.id else { return }
  
    do {
      try store.collection(path).document(userID).setData(from: user)
    } catch {
      fatalError("Unable to update user: \(error.localizedDescription).")
    }
  }
  
  func delete(_ user: User) {
    guard let userID = user.id else { return }
    
    store.collection(path).document(userID).delete {error in
      if let error = error {
        print("Unable to remove user: \(error.localizedDescription)")
      }
    }
  }
}
