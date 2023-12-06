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
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case media
        case location
        case likes
        case dislikes
    }
    
    // MARK: Identifiable
    static func ==(lhs: Clip, rhs: Clip) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func <(lhs: Clip, rhs: Clip) -> Bool {
        return lhs.likes < rhs.likes
    }
}
