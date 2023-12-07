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
    var low_kickout: Int
    var medium_kickout: Int
    var high_kickout: Int
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
        case low_kickout
        case medium_kickout
        case high_kickout
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
  
    // MARK: Example for SwiftUI
    static let example = SkateSpot(
        id: "spot1",
        name: "Schenely Park",
        location: GeoPoint(latitude: 3.2, longitude: 4.1),
        photos: ["basic.landscape"],
        features: [Feature.walls.rawValue],
        overall_kickout: Kickout.high.rawValue,
        low_kickout: 0,
        medium_kickout: 0,
        high_kickout: 1,
        rating_sum: 5,
        rating_avg: 5.0,
        tags: [Tag.Popular.rawValue, Tag.Clean.rawValue, Tag.Safe.rawValue],
        reviews: [Review.example2])

    static let example2 = SkateSpot(
        id: "spot2",
        name: "Deathback Ridge",
        location: GeoPoint(latitude: 20, longitude: -40),
        photos: ["deathly.landscape"],
        features: [Feature.banks.rawValue, Feature.ledges.rawValue],
        overall_kickout: Kickout.na.rawValue,
        low_kickout: 1,
        medium_kickout: 0,
        high_kickout: 1,
        rating_sum: 3,
        rating_avg: 1.5,
        tags: [], //empty to test update
        reviews: [Review.example3, Review.example4])

    static let example3 = SkateSpot(
        name: "Point State Park",
        location: GeoPoint(latitude: 90, longitude: -1),
        photos: ["polluted.landscape"],
        features: [Feature.curbs.rawValue],
        overall_kickout: Kickout.high.rawValue,
        low_kickout: 0,
        medium_kickout: 0,
        high_kickout: 1,
        rating_sum: 3,
        rating_avg: 3.0,
        tags: [Tag.CityArea.rawValue, Tag.New.rawValue],
        reviews: [Review.example])
}
