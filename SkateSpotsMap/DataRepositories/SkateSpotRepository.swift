//
//  SkateSpotRepository.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/4/23.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class SkateSpotRepository: ObservableObject {
    private let path: String = "SkateSpots"
    private let store = Firestore.firestore()
    
    @Published var skate_spots: [SkateSpot] = []
    // Prevents your subscriptions from being deallocated immediately when the scope
    // where they're created exits
    // https://www.donnywals.com/what-exactly-is-a-combine-anycancellable/
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.get()
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting SkateSpots: ", error)
                    return
                }
                
                self.skate_spots = querySnapshot?.documents.compactMap {
                    document in try? document.data(as: SkateSpot.self)
                } ?? []
            }
    }
    
    // MARK: CRUD methods
    func create(_ skate_spot: SkateSpot) {
        do {
            let newSkateSpot = skate_spot
            _ = try store.collection(path).addDocument(from: newSkateSpot)
        } catch {
            fatalError("Unable to add skate spot: \(error.localizedDescription).")
        }
    }
    
    func update(_ skate_spot: SkateSpot) {
        guard let skate_spotID = skate_spot.id else { return }
        
        do {
            try store.collection(path).document(skate_spotID).setData(from: skate_spot)
        } catch {
            fatalError("Unable to update skate spot: \(error.localizedDescription).")
        }
    }
    
    func delete(_ skate_spot: SkateSpot) {
        guard let skate_spotID = skate_spot.id else { return }
        
        store.collection(path).document(skate_spotID).delete {
            error in
            if let error = error {
                print("Unable to remove book: \(error.localizedDescription)")
            }
        }
    }
}
