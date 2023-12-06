//
//  User.swift
//  SkateSpotsMap
//
//  Created by Daniel on 11/7/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Identifiable, Codable, Comparable {
    // MARK: Fields
    @DocumentID var id: String?
    var username: String
    var avatar: String
    var spots: [String] // UUIDs
    var clips: [String] // UUIDs
    var followers: [String] // UUIDs
    var following: [String] // UUIDs
    var interactions: [(String, String)] // UUIDs + Interaction
  
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case avatar = "photo"
        case spots
        case clips
        case followers
        case following
        case interactions
    }
  
    // MARK: Identifiable
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username
    }

    static func <(lhs: User, rhs: User) -> Bool {
        return lhs.username < rhs.username
    }
  
    // MARK: Example for SwiftUI
    static let example = User(
        id: "user1",
        username: "leftovercode",
        avatar: "fake.picture",
        spots: [SkateSpot.example.id ?? "", SkateSpot.example2.id ?? ""],
        clips: [],
        followers: [],
        following: [],
        interactions: [])
    
    static let example2 = User(
      id: "user2",
      username: "leinard0",
      avatar: "better.picture",
      spots: [SkateSpot.example3.id ?? ""],
      clips: [],
      followers: [],
      following: [],
      interactions: [])
    
    static let example3 = User(
      id: "user3",
      username: "sk8trh8tr",
      avatar: "better.picture",
      spots: [],
      clips: [],
      followers: [],
      following: [User.example2.id ?? ""],
      interactions: [])
}
