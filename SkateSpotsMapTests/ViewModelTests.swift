//
//  ViewModelTests.swift
//  SkateSpotsMapTests
//
//  Created by Daniel Johann Arriola on 12/5/23.
//

import XCTest
import CoreLocation
@testable import SkateSpotsMap

final class ViewModelTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    // MARK: SkateSpot View Model
    // Manually tested using device simulator firebase & core location
    func testFindSkateSpot () {
        var target = findSkateSpot(SkateSpot.example.id ?? "")
        XCTAssertEqual(target, SkateSpot.example)
        target = findSkateSpot(SkateSpot.example2.id ?? "")
        XCTAssertEqual(target, SkateSpot.example2)
        target = findSkateSpot(SkateSpot.example3.id ?? "")
        XCTAssertNil(target)
    }
    
    // Same func in SkateSpotViewModel.swift but uses list of test spots
    func findSkateSpot(_ id: String) -> SkateSpot? {
        let spots = [SkateSpot.example, SkateSpot.example2, SkateSpot.example3]
        if let spot = spots.first(where: {$0.id == id}) {
            return spot
        } else {
            return nil
        }
    }
    
    // MARK: Review View Model
    func testCalculateOverallKickout() {
        let reviewVM = ReviewViewModel()
        var spot = SkateSpot.example3
        XCTAssertEqual(spot.overall_kickout, Kickout.high.rawValue)
        XCTAssertEqual(spot.high_kickout, 1)
        XCTAssertEqual(spot.medium_kickout, 0)
        XCTAssertEqual(spot.low_kickout, 0)
        
        spot = reviewVM.updateKickoutVotes(spot: spot, kickout: Kickout.medium.rawValue, x: 1)
        spot.overall_kickout = reviewVM.calculateKickout(spot)
        XCTAssertEqual(spot.overall_kickout, Kickout.high.rawValue)
        XCTAssertEqual(spot.high_kickout, 1)
        XCTAssertEqual(spot.medium_kickout, 1)
        XCTAssertEqual(spot.low_kickout, 0)
        
        spot = reviewVM.updateKickoutVotes(spot: spot, kickout: Kickout.medium.rawValue, x: 1)
        spot.overall_kickout = reviewVM.calculateKickout(spot)
        XCTAssertEqual(spot.overall_kickout, Kickout.medium.rawValue)
        XCTAssertEqual(spot.high_kickout, 1)
        XCTAssertEqual(spot.medium_kickout, 2)
        XCTAssertEqual(spot.low_kickout, 0)
        
        spot = reviewVM.updateKickoutVotes(spot: spot, kickout: Kickout.low.rawValue, x: 1)
        spot = reviewVM.updateKickoutVotes(spot: spot, kickout: Kickout.low.rawValue, x: 1)
        spot.overall_kickout = reviewVM.calculateKickout(spot)
        XCTAssertEqual(spot.overall_kickout, Kickout.medium.rawValue)
        XCTAssertEqual(spot.high_kickout, 1)
        XCTAssertEqual(spot.medium_kickout, 2)
        XCTAssertEqual(spot.low_kickout, 2)
        
        spot = reviewVM.updateKickoutVotes(spot: spot, kickout: Kickout.medium.rawValue, x: -1)
        spot.overall_kickout = reviewVM.calculateKickout(spot)
        XCTAssertNotEqual(spot.overall_kickout, Kickout.medium.rawValue) // Sanity
        XCTAssertEqual(spot.overall_kickout, Kickout.low.rawValue)
        XCTAssertEqual(spot.high_kickout, 1)
        XCTAssertEqual(spot.medium_kickout, 1)
        XCTAssertEqual(spot.low_kickout, 2)
    }
    
    // MARK: User View Model
    func testFindUser() {
        var target = findUser(User.example.id ?? "")
        XCTAssertEqual(target, User.example)
        target = findUser(User.example2.id ?? "")
        XCTAssertEqual(target, User.example2)
        target = findUser(User.example3.id ?? "")
        XCTAssertNil(target)
    }
    
    // Same func in UserViewModel.swift but uses list of test users
    func findUser(_ id: String) -> User? {
        let users = [User.example, User.example2, User.example3]
        if let user = users.first(where: {$0.id == id}) {
            return user
        } else {
            return nil
        }
    }
    
    // MARK: Clip View Model
    func testFindClip () {
        var target = findClip(Clip.example.id ?? "")
        XCTAssertEqual(target, Clip.example)
        target = findClip(Clip.example2.id ?? "")
        XCTAssertNil(target)
    }
    
    // Same func in ClipViewModel.swift but uses list of test clips
    func findClip(_ id: String) -> Clip? {
        let clips = [Clip.example, Clip.example2]
        if let clip = clips.first(where: {$0.id == id}) {
            return clip
        } else {
            return nil
        }
    }
    
    // MARK: Location Manager
    // No test because unable to set precise coordiates for testing.
    // Manually tested using device simulator
    
    // MARK: Google Map View Model
    // Nothing to test
    
    // MARK: Marker View Model
    // Nothing to test
    
    // MARK: Add Spot Google Map View Model
    // No tests as everything is UI
}
