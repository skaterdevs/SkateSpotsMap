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
    case id
    case username
    case avatar // is the right field name on firebase
  }
}
