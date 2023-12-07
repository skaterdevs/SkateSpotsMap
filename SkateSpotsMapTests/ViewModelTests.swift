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
    // No tests as everything is either firebase or using core location unable to set precise coords for testing
    // Manually tested using device simulator
    
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
    // No tests as everything is firebase
    
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