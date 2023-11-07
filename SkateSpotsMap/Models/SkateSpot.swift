//
//  SkateSpot.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/4/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct SkateSpot: Identifiable, Comparable, Codable {
  
  // MARK: Fields
  @DocumentID var id: String?
  var name: String
  var location: GeoPoint
  var photos: [String]
  var features: [String]
  var overall_kickout: String
  var rating_sum: Int
  var rating_avg: Float
  var tags: [String]
  var reviews: [Review]
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case location
    case photos
    case features
    case overall_kickout
    case rating_sum
    case rating_avg
    case tags
    case reviews
  }
  
  // MARK: Comparable
  static func ==(lhs: SkateSpot, rhs: SkateSpot) -> Bool {
    return lhs.id == rhs.id
  }

  static func <(lhs: SkateSpot, rhs: SkateSpot) -> Bool {
    return lhs.rating_avg < rhs.rating_avg
  }
}
