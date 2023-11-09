//
//  Feature.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/6/23.
//

import Foundation

enum Feature: String {
    case walls = "Walls"
    case banks = "Banks"
    case ledges = "Ledges"
    case curbs = "Curbs"
    
    static let allFeatures = ["Walls", "Banks", "Ledges", "Curbs"]
}
