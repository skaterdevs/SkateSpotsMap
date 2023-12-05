//
//  FirebaseTests.swift
//  SkateSpotsMapTests
//
//  Created by Daniel on 12/4/23.
//

import XCTest
import Foundation
import Combine

@testable import SkateSpotsMap

final class FirebaseTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    // MARK: SkateSpotRepository Testing
    func testSkateSpotRepositoryDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let skateSpotRepo = SkateSpotRepository()
            print("Number of Documents: \(skateSpotRepo.skate_spots.count)")
            print(skateSpotRepo.skate_spots)
            XCTAssert(skateSpotRepo.skate_spots.count != 0)
        }
    }
    
    func testSkateSpotRepositoryCreate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let skateSpotRepo = SkateSpotRepository()
            XCTAssert(skateSpotRepo.skate_spots.count != 0)
            let spot: SkateSpot = SkateSpot.example3
            skateSpotRepo.create(spot)
            skateSpotRepo.get()
            XCTAssert(skateSpotRepo.skate_spots.filter{ $0.name == spot.name }.count == 1)
            print("Added SkateSpot: ", skateSpotRepo.skate_spots.filter{ $0.name ==  spot.name})
        }
    }
    
    func testSkateSpotRepositoryUpdate() {
        
    }
    
    func testSkateSpotRepositoryDelete() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let skateSpotRepo = SkateSpotRepository()
            XCTAssert(skateSpotRepo.skate_spots.count != 0)
            let spot = skateSpotRepo.skate_spots.filter{ $0.name == SkateSpot.example3.name }
            XCTAssert(spot.count == 1)
            skateSpotRepo.delete(spot[1])
            XCTAssert(skateSpotRepo.skate_spots.filter{ $0.name == spot[0].name }.count == 0)
            print("Deleted SkateSpot: ", spot[1])
        }
    }
    
    // MARK: ClipRepository Testing
    func testClipRepositoryDidLoad() {
        
    }
    
    func testClipRepositoryCreate() {
        
    }
    
    func testClipRepositoryUpdate() {
        
    }
    
    func testClipRepositoryDelete() {
        
    }
    
    // MARK: UserRepository Testing
    func testUserRepositoryDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let userRepo = UserRepository()
            print("Number of Documents: \(userRepo.users.count)")
            print(userRepo.users)
            XCTAssert(userRepo.users.count != 0)
        }
    }
    
    func testUserRepositoryCreate() {
        
    }
    
    func testUserRepositoryUpdate() {
        
    }
    
    func testUserRepositoryDelete() {
        
    }
}
