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
    var spots: [String] // SkateSpot UUIDs
    var clips: [String] // Clip UUIDs
    var followers: [String] // User UUIDs
    var following: [String] // User UUIDs
    var liked: [String] // Clip UUID
    var disliked: [String] // Clip UUID
  
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case avatar = "photo"
        case spots
        case clips
        case followers
        case following
        case liked
        case disliked
    }
  
    // MARK: Identifiable
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
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
        liked: [],
        disliked: [])
    
    static let example2 = User(
      id: "user2",
      username: "leinard0",
      avatar: "better.picture",
      spots: [SkateSpot.example3.id ?? ""],
      clips: [],
      followers: [],
      following: [],
      liked: [],
      disliked: [])
    
    static let example3 = User(
      username: "sk8trh8tr",
      avatar: "better.picture",
      spots: [],
      clips: [],
      followers: [],
      following: [User.example2.id ?? ""],
      liked: [],
      disliked: [])
}
