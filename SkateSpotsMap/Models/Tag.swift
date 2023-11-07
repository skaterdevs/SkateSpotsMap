//
//  Tag.swift
//  SkateSpotsMap
//
//  Created by Daniel on 11/6/23.
//

import Foundation

enum Tag {
  case Clean, New, Popular, Dirty, Safe, CityArea
  case BeginnerFriendly, Dangerous
  func desc() -> String {
    switch self {
    case .Clean:
      return "Clean"
    case .New:
      return "New"
    case .Popular:
      return "Popular"
    case .Dirty:
      return "Dirty"
    case .Safe:
      return "Safe"
    case .CityArea:
      return "City Area"
    case .BeginnerFriendly:
      return "Beginner Friendly"
    case .Dangerous:
      return "Dangerous"
    }
  }
}
