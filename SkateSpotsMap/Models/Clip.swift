//
//  Clip.swift
//  SkateSpotsMap
//
//  Created by Jason Perez on 12/5/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Clip: Identifiable, Comparable, Codable {
    // MARK: Fields
    @DocumentID var id: String?
    // TODO: Maybe rename Reviewer struct
    var user: Reviewer
    var media: [String]
    var location: String
    var likes: Int
    var dislikes: Int
    var timestamp: Timestamp
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case media
        case location
        case likes
        case dislikes
        case timestamp
    }
    
    // MARK: Identifiable
    static func ==(lhs: Clip, rhs: Clip) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func <(lhs: Clip, rhs: Clip) -> Bool {
        // The left operand is smaller than the right operand
        return lhs.timestamp.compare(rhs.timestamp) == ComparisonResult.orderedAscending
    }
    
    // MARK: Example for SwiftUI
    static let example = Clip(
        id: "clip1",
        user: Reviewer.example,
        media: [],
        location: "",
        likes: 0,
        dislikes: 0,
        timestamp: Timestamp())
    
    static let example2 = Clip(
        user: Reviewer.example2,
        media: [],
        location: "",
        likes: 50,
        dislikes: 0,
        timestamp: Timestamp())
}
