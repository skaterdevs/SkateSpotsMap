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
  var id: String
  var rating: Int
  var tags: [String]
  var reviewer: Reviewer
  var comment: String?
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
    id: "review1",
    rating: 3,
    tags: [Tag.CityArea.rawValue, Tag.New.rawValue],
    reviewer: Reviewer.example,
    comment: "ya know, ive been to better but ive also been to worse",
    kickout: Kickout.high.rawValue)
    
    static let example2 = Review(
      id: "review2",
      rating: 5,
      tags: [Tag.Popular.rawValue, Tag.Clean.rawValue, Tag.Safe.rawValue],
      reviewer: Reviewer.example2,
      comment: "dangnabit this place do be popping my brother in christ",
      kickout: Kickout.high.rawValue)
    
    static let example3 = Review(
      id: "review3",
      rating: 1,
      tags: [Tag.Dangerous.rawValue, Tag.Dirty.rawValue],
      reviewer: Reviewer.example,
      comment: "this place sucky",
      kickout: Kickout.high.rawValue)
    
    static let example4 = Review(
      id: "review4",
      rating: 2,
      tags: [Tag.Dirty.rawValue],
      reviewer: Reviewer.example,
      comment: "its ight ya know",
      kickout: Kickout.low.rawValue)
}
