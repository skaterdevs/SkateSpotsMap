//
//  ModelTests.swift
//  SkateSpotsMapTests
//
//  Created by Daniel on 12/4/23.
//

import XCTest
@testable import SkateSpotsMap

final class ModelTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    // MARK: SkateSpot Model Testing
    func testSkateSpotIsEqual() {
        var changeling = SkateSpot.example3
        changeling.id = SkateSpot.example.id
        XCTAssert(SkateSpot.example != SkateSpot.example2)
        XCTAssert(SkateSpot.example != SkateSpot.example3)
        XCTAssert(SkateSpot.example2 != SkateSpot.example3)
        XCTAssert(SkateSpot.example == SkateSpot.example)
        XCTAssert(SkateSpot.example == changeling)
        changeling.id = nil
        XCTAssert(SkateSpot.example3 == changeling)
    }
    
    func testSkateSpotIsSortable() {
        var unorderedSpots = [SkateSpot.example, SkateSpot.example2, SkateSpot.example3]
        let orderedSpots = [SkateSpot.example2, SkateSpot.example3, SkateSpot.example]
        unorderedSpots.sort()
        XCTAssert(unorderedSpots[0] == orderedSpots[0])
        XCTAssert(unorderedSpots[1] == orderedSpots[1])
        XCTAssert(unorderedSpots[2] == orderedSpots[2])
    }
    
    // MARK: Review Model Testing
    func testReviewIsEqual() {
        var changeling = Review.example3
        changeling.id = Review.example.id
        XCTAssert(Review.example != Review.example2)
        XCTAssert(Review.example != Review.example3)
        XCTAssert(Review.example2 != Review.example3)
        XCTAssert(Review.example == Review.example)
        XCTAssert(Review.example == changeling)
        XCTAssert(Review.example2 == Review.example2)
        XCTAssert(Review.example3 == Review.example3)
        XCTAssert(Review.example4 == Review.example4)
    }
    
    func testReviewIsSortable() {
        var unorderedSpots = [Review.example2, Review.example4, Review.example, Review.example3]
        let orderedSpots = [Review.example3, Review.example4, Review.example, Review.example2]
        unorderedSpots.sort()
        XCTAssert(unorderedSpots[0] == orderedSpots[0])
        XCTAssert(unorderedSpots[1] == orderedSpots[1])
        XCTAssert(unorderedSpots[2] == orderedSpots[2])
        XCTAssert(unorderedSpots[3] == orderedSpots[3])
    }
    
    // MARK: User Model Testing
    func testUserIsEqual() {
        var changeling = User.example3
        changeling.id = User.example.id
        XCTAssert(User.example != User.example2)
        XCTAssert(User.example != User.example3)
        XCTAssert(User.example2 != User.example3)
        XCTAssert(User.example == User.example)
        XCTAssert(User.example == changeling)
        XCTAssert(User.example2 == User.example2)
        XCTAssert(User.example3 == User.example3)
    }
    
    func testUserIsSortable() {
        var unorderedSpots = [Review.example2, Review.example4, Review.example, Review.example3]
        let orderedSpots = [Review.example3, Review.example4, Review.example, Review.example2]
        unorderedSpots.sort()
        XCTAssert(unorderedSpots[0] == orderedSpots[0])
        XCTAssert(unorderedSpots[1] == orderedSpots[1])
        XCTAssert(unorderedSpots[2] == orderedSpots[2])
        XCTAssert(unorderedSpots[3] == orderedSpots[3])
    }
}
