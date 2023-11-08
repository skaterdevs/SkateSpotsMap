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
  var spots: [SkateSpot]
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case username
    case avatar = "photo"
    case spots
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
    spots: [SkateSpot.example1, SkateSpot.example2])
    
    static let example1 = User(
      id: "user2",
      username: "leinard0",
      avatar: "better.picture",
      spots: [SkateSpot.example3])
}
