//
//  Reviewer.swift
//  SkateSpotsMap
//
//  Created by Daniel on 11/6/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Reviewer: Identifiable, Codable {
  // MARK: Fields
  var id: String
  var username: String
  var avatar: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id = "user_id"
    case username
    case avatar = "photo"
  }
  
  // MARK: Example for SwiftUI
  static let example = Reviewer(
    id: "dsalfjdlfjcl",
    username: "leftovercode",
    avatar: "fake.picture")
}
