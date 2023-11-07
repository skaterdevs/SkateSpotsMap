//
//  Review.swift
//  SkateSpotsMap
//
//  Created by Daniel on 11/6/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Review: Identifiable, Codable, Comparable {
  // MARK: Fields
  @DocumentID var id: String?
  var rating: Int
  var tags: [String]
  var reviewer: Reviewer
  var comment: String
  var kickout: String
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id = "review_id"
    case rating
    case tags
    case reviewer = "user" // is the right field name on firebase
    case comment
    case kickout
  }
  
  // MARK: Identifiable
  static func ==(lhs: Review, rhs: Review) -> Bool {
      return lhs.id == rhs.id
  }

  static func <(lhs: Review, rhs: Review) -> Bool {
      return lhs.rating < rhs.rating
  }
  
  // MARK: Example for SwiftUI
  static let example = Review(
    id: "dsalfjdlfjcl",
    rating: 3,
    tags: [Tag.Dangerous.rawValue],
    reviewer: Reviewer.example,
    comment: "this place sucky",
    kickout: Kickout.high.rawValue)
}
