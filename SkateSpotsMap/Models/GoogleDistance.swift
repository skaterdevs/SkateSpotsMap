//
//  GoogleDistance.swift
//  SkateSpotsMap
//
//  Created by Daniel on 11/9/23.
//

import Foundation

struct DistanceMatrix: Codable {
    var destination_addresses: [String]
    var origin_addresses: [String]
    var rows: [DistanceMatrixRow]
    var status: String
    var error_message: String?
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case destination_addresses
        case origin_addresses
        case rows
        case status
        case error_message
    }
}

struct DistanceMatrixRow: Codable {
    var elements: [DistanceMatrixElement]
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case elements
    }
}

struct DistanceMatrixElement: Codable {
    var status: String
    var distance: TextValue?
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case status
        case distance
    }
}

struct TextValue: Codable {
    var text: String // in unit system of origin (contains units)
    var value: Int // in meters
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case text
        case value
    }
}
